//
//  registerVC.swift
//  Yang_WU_Lab4
//
//  Created by yang on 2017/10/28.
//  Copyright © 2017年 yang. All rights reserved.
//


import Foundation
import UIKit


//store global vars such as sessions
class Global{
    var session: String?
}

let global = Global()


//reference:
//http://www.kaleidosblog.com/how-to-create-a-login-screen-page-in-swift-3-authenticate-an-user-and-keep-the-session-active


class RegisterVC: UIViewController{
    
//    outlets

    @IBOutlet weak var userName_old: UITextField!
    @IBAction func login(_ sender: UIButton) {
        logIn()
    }
    @IBAction func Register(_ sender: UIButton) {
        getSession()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "Favourite") as! SecondViewController
        navigationController?.pushViewController(destination, animated: true)

    }
    

    
//   variables
    let api_key = "6d83faf384577d5ff6ae43b20fc978c3"
    var token: String?

    
//    get session id
    func getSession(){
            print("getsession\(token!)")
            let requestPath: String = "https://api.themoviedb.org/3/authentication/session/new?api_key=\(api_key)&request_token=\(token!)"
//            print(requestPath)
            let requestID = getJSON(path: requestPath)
//            print(requestID)
            let sessionID = requestID["session_id"].string
//            print(sessionID)
            global.session = sessionID
//            print("session received from request \(global.session)")
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
    
    
    
//    login with tmdb get token
    func logIn(){
        var theName = userName_old.text!
        var requestToken = getJSON(path: "https://api.themoviedb.org/3/authentication/token/new?api_key=" + api_key)
        let getToken = requestToken["request_token"].string!
        token = getToken
        var url: URL!
        url = URL(string: "https://www.themoviedb.org/authenticate/\(getToken)")
        UIApplication.shared.canOpenURL(url)
        UIApplication.shared.open(url!, options: [:], completionHandler: {
            (success) in
        //            print("Open url : \(success)")
        })
//        print("token received from log in \(token)")
        getSession()
//        return token
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
