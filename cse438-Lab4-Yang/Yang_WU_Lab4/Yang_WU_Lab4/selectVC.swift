//
//  selectVC.swift
//  Yang_WU_Lab4
//
//  Created by yang on 2017/10/23.
//  Copyright © 2017年 yang. All rights reserved.
//
//scene for specific film
import Foundation
import UIKit
import MediaPlayer
import AVKit
import AVFoundation

//reference://https://stackoverflow.com/questions/25034497/playing-a-video-file-from-a-server-in-swift


class SelectVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
//    VARS
    var passedTitle:String?
    var passedId:String?
    var passedRating:Double?
    var passedImg:UIImage?
    var passedRelease:String?
    var theArray:[String] = []
    var pathArray = [String]()
    
    @IBOutlet weak var theCollectionView: UICollectionView!
    
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
    
    
    
    

    func getVideo() {
    let trailors = getJSON(path: "https://api.themoviedb.org/3/movie/" + passedId! + "/videos?api_key=6d83faf384577d5ff6ae43b20fc978c3&language=en-US")
    let trailorINFO = trailors["results"].array
        for eachFilm in trailorINFO!{
        let eachPath = "https://www.youtube.com/watch?v=" + eachFilm["key"].string!
        pathArray.append(eachPath)
//        print(eachPath)
        }
//    print(pathArray)
        
//THIS SNIPPIT PLAYS THE VIDEO BUT WILL NEED API FOR YOUTUBE
//    let trailerID: String = "SUXWAEX2jlg"
//    let videoPath: String = "https://www.youtube.com/watch?v=SUXWAEX2jlg"
//    let videoURL = URL(string: videoPath)!
//    let data = try? Data(contentsOf: videoURL)
//        print(data)
//    let player = AVPlayer(url: videoURL)
//    let controller = AVPlayerViewController()
//    controller.player = player
//    self.addChildViewController(controller)
//    let screenSize = UIScreen.main.bounds.size
//    let videoFrame = CGRect(x: 0, y: 10, width: screenSize.width, height: (screenSize.height - 10) * 0.5)
//    controller.view.frame = videoFrame
//    self.view.addSubview(controller.view)
//    player.play()
//        or do this to open url
//    UIApplication.shared.canOpenURL(videoURL)
//    UIApplication.shared.openURL(videoURL)
}
//THIS SNIPPIT PLAYS THE VIDEO BUT WILL NEED API FOR YOUTUBE

    
    
//    collectionview
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pathArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrailorCell", for: indexPath)
        let video = pathArray[indexPath.row]
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30.0))
//        var button = UIButton()
//        button.setTitle("Traolor", for:.normal)
        label.text = "Trailor"
        cell.contentView.addSubview(label)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let video = pathArray[indexPath.row]
        let videoURL = URL(string: video)
        UIApplication.shared.canOpenURL(videoURL!)
        UIApplication.shared.openURL(videoURL!)
    }
//    collectionview



    
    
    @IBAction func addFav(_ sender: UIButton) {
        saveData()
    }
    
    @IBAction func deleteFav(_ sender: UIButton) {
        let userDefults = UserDefaults.standard
        var array = userDefults.object(forKey:"theArray") as? [String] ?? [String]()
//        array.removeFirst()
        for object in array
        {
            if object == passedTitle{
                array.remove(at: array.index(of: passedTitle!)!)
            }
        }
        
        userDefults.set(array, forKey: "theArray")
        userDefults.synchronize()
    }
    
    
    
    
    @IBOutlet weak var largeImg: UIImageView!
    @IBOutlet weak var theTitle: UILabel!
    @IBOutlet weak var theRating: UILabel!
    @IBOutlet weak var theCountry: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        theCollectionView.dataSource = self
        theCollectionView.delegate = self
        largeImg.image = passedImg
        theTitle.text = passedTitle
        theCountry.text = passedRelease
        theRating.text = String(format:"%.2f", passedRating!)
//        print(passedId)
        getVideo()
        
        
        // Do any additional setup after loading the view.
    }
    

    

    func saveData () {
        let userDefults = UserDefaults.standard
        
//        this returns the array from userdefault if there is any
        var array = userDefults.object(forKey:"theArray") as? [String] ?? [String]()
        array.append(passedTitle!)
        userDefults.set(array, forKey: "theArray")
        print(array)
        userDefults.synchronize()

    }
    
    
    
    
    
    
    
}
