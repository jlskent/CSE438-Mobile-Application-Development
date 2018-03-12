//
//  FirstViewController.swift
//  Yang_WU_Lab4
//
//  Created by yang on 2017/10/10.
//  Copyright © 2017年 yang. All rights reserved.
//
//    https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher



import UIKit


//https://shrikar.com/swift-ios-tutorial-uisearchbar-and-uisearchbardelegate/

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate, UIScrollViewDelegate {

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navText.title = "Popular Films"
        if global.session != nil{
        navText.title = "HiTom"
        }
        
        
    }
    
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        theCollectionView.dataSource = self
        theCollectionView.delegate = self
        searchBar.delegate = self
        self.definesPresentationContext = true
        Spinner.hidesWhenStopped = true
        Spinner.stopAnimating()
        latestMovie()
        cacheImages()
    }
 
    
    
    
    
//    outlets and vars
    @IBAction func userLogin(_ sender: UIBarButtonItem) {

        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "theReg") as! RegisterVC
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
    @IBAction func userLogout(_ sender: UIBarButtonItem) {
        global.session = nil
    }
    
    
    @IBOutlet weak var navText: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var theCollectionView: UICollectionView!
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    
    
    
    
    var searchActive : Bool = false
    var search: String?
    var theProfile = Profile()

//    var theProfile = Profile()
    var searchedProfiles = [Profile]()
//    var searchedProfiles = []
//    var myArray:[String] = ["bob","mary","mike"]
//    var newLabel: String = "Hey"
//    var filtered:[String] = []
    var imageCache: [String: UIImage?] = [:]
//    var searchedProfiles: [Profile] = []

//    let main = DispatchQueue.main
//    let background = DispatchQueue.global()
//    let helper = DispatchQueue(label: "another_thread")
//    background.async { //async tasks here }
//    background.sync { //sync tasks here }
//    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search = searchBar.text
   
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navText.title = "Search results"
        DispatchQueue.main.async {
            self.Spinner.startAnimating()
        }
        
        DispatchQueue.global(qos: .default).async {
            self.getData()
            self.cacheImages()
            self.theCollectionView.reloadData()
            self.Spinner.stopAnimating()

        }
    }

   
    
    
//    save images from url with id key
    private func cacheImages() {
        for item in searchedProfiles {
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + item.url)
            let id = item.id
//            print(url)
            var image: UIImage?
                let data = try? Data(contentsOf: url!)
//                        print(data)
                    image = UIImage(data: data!)
//                    print(image)
                    imageCache.updateValue(image, forKey: id!)
        }
    }

    
    
    

//    collectionview
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedProfiles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! customizedCell
//        print(searchedProfiles)
        let movie = searchedProfiles[indexPath.row]
//        print(movie.title)
        cell.cellLabel.text = movie.title
        let theImage = imageCache[movie.id]
//        cell.backgroundView = UIImageView(image: theImage!)
        cell.imageView.image = theImage!
//        if let theImage = theImage {
//        print(theImage!)
//        cell.imageView.image! = theImage!
//        }
//           conditional unwrap with if let (note)
//        else {
//            print("No value")
//        }
        return cell
    }
//end of collectionview
    

    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        NSLog("You selected cell number: \(indexPath.row)!")
//        self.performSegueWithIdentifier("yourIdentifier", sender: self)
//    }
    
    
//    go to specific movie and pass data
//    https://stackoverflow.com/questions/30773529/open-new-view-controller-by-clicking-cell-in-table-view-swift-ios
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "theID") as! SelectVC
        navigationController?.pushViewController(destination, animated: true)
        
        let movie = searchedProfiles[indexPath.row]
        destination.passedTitle = movie.title
        destination.passedId = movie.id
        destination.passedRelease = movie.release
        destination.passedRating = movie.rating
        let idSet = movie.id
        destination.passedImg = imageCache[idSet!]!

    }
    
  
    
    //helper func from swifty json
    private func getJSON(path: String) -> JSON {
        guard let url = URL(string: path) else { return JSON.null }
        do {
            
            let data = try Data(contentsOf: url)
            return try JSON(data: data)
        } catch {
            return JSON.null
        }
    }

    
    
//show latestmovie for homepage
    func latestMovie() {
        let myData = getJSON(path: "https://api.themoviedb.org/3/movie/now_playing?api_key=6d83faf384577d5ff6ae43b20fc978c3&language=en-US&page=1")
        var theProfile = Profile()
        //        init a instance
        let results = myData["results"]
        //                  print(results)
        for result in results.array! {
            let id = result["id"].stringValue
//                    print(id)
            let title = result["title"].stringValue
            let url = result["poster_path"].stringValue
            let rating = result["vote_average"].doubleValue
            let release = result["release_date"].stringValue
            theProfile.title = title
            theProfile.id = id
            theProfile.url = url
            theProfile.rating = rating
            theProfile.release = release
            //            print(url)
            //            print(theProfile)
            //            print(theProfile.rating)
            searchedProfiles.append(theProfile)
        }
}

    
    
    

    
    
//    function to get data search
    func getData() {
        searchedProfiles = []

//        let myData = getJSON(path: "https://api.themoviedb.org/3/search/movie?api_key=6d83faf384577d5ff6ae43b20fc978c3&query=Jack+Reacher")
//        let search = "Jack+Reacher"
//        search = "Jack+Reacher"
        let myData = getJSON(path: "https://api.themoviedb.org/3/search/movie?api_key=6d83faf384577d5ff6ae43b20fc978c3&query=" + search!)
        var theProfile = Profile()
        //        init a instance
        let results = myData["results"]
//                  print(results)
        for result in results.array! {
            let id = result["id"].stringValue
            //            print(id)
            let title = result["title"].stringValue
            let url = result["poster_path"].stringValue
            let rating = result["vote_average"].doubleValue
            let release = result["release_date"].stringValue

            theProfile.title = title
            theProfile.id = id
            theProfile.url = url
            theProfile.rating = rating
            theProfile.release = release
            //            print(url)
//            print(theProfile)
//            print(theProfile.rating)
            searchedProfiles.append(theProfile)

        }
//        print(searchedProfiles)
//        print(searchedProfiles.count)
        }
    
    
    
}
