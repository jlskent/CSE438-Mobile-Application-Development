//
//  ViewController.swift
//  ShoppingCalculator
//
//  Created by yang on 2017/9/5.
//  Copyright © 2017年 yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
  //MARK: GRABFROMUI
    
    @IBOutlet weak var savedPrice: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var taxTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Actions

    
    var originalPrice: Double?
    var discount: Double?
    var tax: Double?
    var op: Double?
    var priceSet = [String]()
    var str: String = ""
    
    
    
    @IBAction func change(_ sender: Any) {
        
        
        guard let originalPrice = Double(priceTextField.text!) else {
            print("Invalid price")
            return
        }
        guard let discount = Double(discountTextField.text!) else {
            print("Invalid discount")
            return
        }
        guard let tax = Double(taxTextField.text!) else {
            print("Invalid tax")
            return
        }
        if discount > 0 {
       let op = (originalPrice * discount )/100 * ( 1 + tax / 100 )
//        print(op)
        
       let displayText = "$\(String(format: "%.2f", op))"
       resultLabel.text = displayText
            priceSet.append(displayText)

        }
        
        else {
            let op = originalPrice * ( 1 + tax / 100 )

            let displayText = "$\(String(format: "%.2f", op))"
            resultLabel.text = displayText
        
        
       //save to array priceSet
        priceSet.append(displayText)
        }
        
    }
//   end of change ibaction
    
    
    @IBAction func showhistory(_ sender: UIButton){
        str = ""
        for price in priceSet {
                str += "| \(price)"
        
        }
        savedPrice.text = str
        

    }
    //end of button

    
}
//end of viewcontroller

