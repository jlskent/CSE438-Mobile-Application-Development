//
//  ViewController.swift
//  CircleApp
//
//  Created by Todd Sproull on 9/20/17.
//  Copyright © 2017 Todd Sproull. All rights reserved.
//

import UIKit



//this is an extension that allow modifying rounded corner button
//resource:
//https://stackoverflow.com/questions/38874517/how-to-make-a-simple-rounded-button-in-storyboard
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}




class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var canvas: CircleView!

    
    
//    these vars are just used to store valvar
    var currentCircleCenter = CGPoint.zero
    var currentCircle: Circle?
    var currentDot = Circle (center: [CGPoint.zero], radius: 0, color: UIColor.black, fillSwitch: false)
    var currentColor: UIColor = UIColor.black
    var lineWeight: CGFloat? = 3.0
    var currentSwitch: Bool = false
    
    
    //    reference for selecting and saving pic to photo gallery
    //    https://stackoverflow.com/questions/39519773/nsphotolibraryusagedescription-key-must-be-present-in-info-plist-to-use-camera-r
    //    https://stackoverflow.com/questions/25444609/screenshot-in-swift-ios
    //   https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
    
    
//    function to view image by accessing gallery
   func openImg(alert: UIAlertAction!) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func Save(_ sender: UIButton) {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        view.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        
//        resource on creating alerts
//        https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
        
        
        // create the alert
        let alert = UIAlertController(title: "Success", message: "Image saved to photo gallery. Would you like to view?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Stay in drawing app", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Go to photo gallery", style: UIAlertActionStyle.cancel, handler: openImg))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    

    
    @IBAction func Erase(_ sender: UIButton) {
        currentColor = UIColor.white
    }
    @IBAction func Red(_ sender: UIBarButtonItem) {
        currentColor = UIColor.red
    }
    @IBAction func Green(_ sender: UIBarButtonItem) {
        currentColor = UIColor.green
    }
    @IBAction func Black(_ sender: UIBarButtonItem) {
        currentColor = UIColor.black
    }
    @IBAction func Yellow(_ sender: UIBarButtonItem) {
        currentColor = UIColor.yellow
    }
    @IBAction func BLue(_ sender: UIBarButtonItem) {
        currentColor = UIColor.blue
    }
    
    @IBAction func undo(_ sender: UIBarButtonItem) {
        if !canvas.lines.isEmpty {
            canvas.lines.removeLast()
        }
        if !canvas.dots.isEmpty {
            canvas.dots.removeLast()
        }
    }
    @IBAction func lineweightSlider(_ sender: UISlider) {
        lineWeight = CGFloat(sender.value)
    }
    
    @IBAction func Fill(_ sender: UIButton) {
        currentSwitch = true
    }
    @IBAction func lineMode(_ sender: UIButton) {
        currentSwitch = false
    }

    @IBAction func clearScreen(_ sender: Any)   {
          canvas.lines.removeAll()
          canvas.dots.removeAll()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        canvas = CircleView(frame:self.view.frame)
//        view.addSubview(canvas)
//        view(circleCanvas)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentCircle = Circle(center: [touchPoint], radius: lineWeight!, color: currentColor, fillSwitch: currentSwitch)
        currentDot = Circle(center: [touchPoint], radius: lineWeight!, color: currentColor, fillSwitch: currentSwitch)
        let newDot = currentDot
        canvas.dots.append(newDot)
//        print(currentDot)
    
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
//        print("point is \(touchPoint)")
        currentCircle?.center.append(touchPoint)
        canvas.theCircle = currentCircle!
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let newLine = currentCircle {
        canvas.lines.append(newLine)
       // print("break \(canvas.lines)")
        }
        canvas.theCircle = Circle(center: [], radius: 0, color: UIColor.black, fillSwitch: currentSwitch)
//        print(currentSwitch )
        
    }
    

}

