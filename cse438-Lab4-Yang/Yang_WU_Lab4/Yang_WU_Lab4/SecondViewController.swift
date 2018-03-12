//
//  SecondViewController.swift
//  Yang_WU_Lab4
//
//  Created by yang on 2017/10/10.
//  Copyright © 2017年 yang. All rights reserved.
//

import UIKit




//show favourites films
class SecondViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    
    
    @IBOutlet weak var theTable: UITableView!
    var myArray:[String] = []
    var DBArray:[String] = []

    
    
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

    
    
//    get favourite list from tmDB
    func getDBlist() {
        myArray = []
        DBArray = []
        let myData = getJSON(path: "https://api.themoviedb.org/3/account/2/favorite/movies?api_key=6d83faf384577d5ff6ae43b20fc978c3&session_id=" + global.session! + "&sort_by=created_at.asc")
//        print(thePath)
//        print(myData)
        let results = myData["results"]
//        print(results)
        for result in results.array! {
            let title = result["title"].stringValue
            print(title)
            DBArray.append(title)
        }
        print("DB\(DBArray)")
        myArray = DBArray
    }
    
    
    
//    get list from local storage if not logged in
    func retrieveData(){
        myArray = []
        let userDefults = UserDefaults.standard
        let array = userDefults.object(forKey:"theArray") as? [String] ?? [String]()
        myArray = array
        print(myArray)
    }
    


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        myCell.textLabel?.text = myArray[indexPath.row]
//        self.theTable.reloadData()
        return myCell
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.definesPresentationContext = true
        //        viewWillAppear(false)
        theTable.dataSource = self
        theTable.delegate = self
        retrieveData()
        if global.session != nil {
        getDBlist()
        }
        self.theTable.reloadData()
    }

    
    override func viewDidLoad() {
//        myArray = []
        super.viewDidLoad()
//        self.definesPresentationContext = true
////        viewWillAppear(false)
//        theTable.dataSource = self
//        theTable.delegate = self
//        retrieveData()
//        getDBlist()
//        self.theTable.reloadData()
//        print("sessionpushed\(global.session)")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

