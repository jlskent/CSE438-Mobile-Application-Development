////
////  ViewController.swift
////  virtualpet
////
////  Created by yang on 2017/9/11.
////  Copyright © 2017年 yang. All rights reserved.
////
//
//import UIKit
//
//
//
//class ViewController: UIViewController {
//
////    outlets
//    @IBOutlet weak var petImg: UIImageView!
//    @IBOutlet weak var happiness: UILabel!
//    @IBOutlet weak var food: UILabel!
//    @IBOutlet weak var backgroundColor: UIView!
//    @IBOutlet weak var happinessBar: displayView!
//    @IBOutlet weak var foodBar: displayView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        defaultDisplay()
//        storeData()
//        let plistPath = Bundle.main.path(forResource: "savedData", ofType: "plist");
//        let dictionary: NSMutableDictionary = NSMutableDictionary(contentsOfFile: plistPath!)!;
//        NSLog("ditionary - %@",dictionary);
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    
////    variables
//    var happinessValue: Double = 50
//    var foodLevel: Double = 50
//    var strH: String?
//    var strF: String?
//    var happinessCG: CGFloat?
//    var foodCG: CGFloat?
//    var currentPet = ""
//    var dictionary: NSMutableDictionary?
//    
//    var foodLevelCat: Double = 50
//    var foodLevelDog: Double = 50
//    var foodLevelBird: Double = 50
//    var foodLevelFish: Double = 50
//    var foodLevelBunny: Double = 50
//    var happinessCat: Double = 50
//    var happinessDog: Double = 50
//    var happinessBird: Double = 50
//    var happinessFish: Double = 50
//    var happinessBunny: Double = 50
//    
//    
////    store the data after logout
//    func storeData () {
//        let plistPath = Bundle.main.path(forResource: "savedData", ofType: "plist");
//        let dictionary: NSMutableDictionary = NSMutableDictionary(contentsOfFile: plistPath!)!;
//        dictionary.setObject(123, forKey:"blabla" as NSCopying)
//        dictionary["SomethingYeah"] = "hihihihihihi"
//        dictionary.setValue("hey", forKey: "SomethingYeah")
////        dictionary.setValue(80, forKey: "happinessCat")
//        dictionary.write(toFile: plistPath!, atomically: true)
//        print(dictionary)
////        let valueYes = dictionary["happinessCat"]
////        print(valueYes)
//    }
//    
//    
//    
////    load default pet
//    func defaultDisplay () {
//    currentPet = "Dog"
//    barDisplay (animated: false)
//    happinessBar.color = getRandomColor()
//    foodBar.color = happinessBar.color
//
//}
//    
//    
//    
//    
////    generates a random color
//    func getRandomColor() -> UIColor{
//        //Generate between 0 to 1
//        let red:CGFloat = CGFloat(drand48())
//        let green:CGFloat = CGFloat(drand48())
//        let blue:CGFloat = CGFloat(drand48())
//        
//        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
//    }
////    color generator ref https://stackoverflow.com/questions/29779128/how-to-make-a-random-background-color-with-swift
//    
//    
//    
//    
////Display different pets
//    @IBAction func cat(_ sender: UIButton) {
//        currentPet = "Cat"
//        barDisplay (animated: false)
//        food.text = String(foodLevelCat)
//        happiness.text = String(happinessCat)
//        petImg.image = UIImage(named: "cat")
//        backgroundColor.backgroundColor = UIColor(red:0.89, green:0.44, blue:0.44, alpha:1.0)
//        happinessBar.color = getRandomColor()
//        foodBar.color = happinessBar.color
////        storeData()
//
//
//
//    }
//    @IBAction func dog(_ sender: UIButton) {
//        currentPet = "Dog"
//        barDisplay (animated: false)
//        food.text = String(foodLevelDog)
//        happiness.text = String(happinessDog)
//        petImg.image = UIImage(named: "dog")
//        backgroundColor.backgroundColor = UIColor.blue
//        happinessBar.color = getRandomColor()
//        foodBar.color = happinessBar.color
//
//
//
//    }
//    @IBAction func bird(_ sender: UIButton) {
//        currentPet = "Bird"
//        barDisplay (animated: false)
//        food.text = String(foodLevelBird)
//        happiness.text = String(happinessBird)
//        petImg.image = UIImage(named: "bird")
//        backgroundColor.backgroundColor = UIColor(red:0.86, green:0.92, blue:0.20, alpha:1.0)
//        happinessBar.color = getRandomColor()
//        foodBar.color = happinessBar.color
//
//
//
//    }
//    
//    @IBAction func bunny(_ sender: UIButton) {
//        currentPet = "Bunny"
//        barDisplay (animated: false)
//        food.text = String(foodLevelBunny)
//        happiness.text = String(happinessBunny)
//        petImg.image = UIImage(named: "bunny")
//        backgroundColor.backgroundColor = UIColor(red:0.30, green:0.84, blue:0.64, alpha:1.0)
//        happinessBar.color = getRandomColor()
//        foodBar.color = happinessBar.color
//
//
//    }
//    @IBAction func fish(_ sender: UIButton) {
//        currentPet = "Fish"
//        barDisplay (animated: false)
//        food.text = String(foodLevelFish)
//        happiness.text = String(happinessFish)
//        petImg.image = UIImage(named: "fish")
//        backgroundColor.backgroundColor = UIColor(red:0.93, green:0.54, blue:0.89, alpha:1.0)
//        happinessBar.color = getRandomColor()
//        foodBar.color = happinessBar.color
//
//
//    }
//    
//    
//    
////    feed or play the pets
//    @IBAction func feed(_ sender: UIButton) {
//        switch currentPet {
//        case "Cat":
//            foodLevelCat = foodLevelCat + 1
//            food.text = String(foodLevelCat)
//            barDisplay (animated: true)
////            storeData()
//
//        case "Dog":
//            foodLevelDog = foodLevelDog + 1
//            food.text = String(foodLevelDog)
//            barDisplay (animated: true)
//        case "Fish":
//            foodLevelFish = foodLevelFish + 1
//            food.text = String(foodLevelFish)
//            barDisplay (animated: true)
//        case "Bird":
//            foodLevelBird = foodLevelBird + 1
//            food.text = String(foodLevelBird)
//            barDisplay (animated: true)
//        case "Bunny":
//            foodLevelBunny = foodLevelBunny + 1
//            food.text = String(foodLevelBunny)
//            barDisplay (animated: true)
//        default:
//            print("Some other character")
//        }
//        
//        
//        
//
//    }
//    @IBAction func play(_ sender: UIButton) {
//        
//        switch currentPet {
//        case "Cat":
//            happinessCat = happinessCat + 1
//            happiness.text = String(happinessCat)
//            barDisplay (animated: true)
//            foodLevel = foodLevelCat
//        case "Dog":
//            happinessDog = happinessDog + 1
//            happiness.text = String(happinessDog)
//            barDisplay (animated: true)
//        case "Fish":
//            happinessFish = happinessFish + 1
//            happiness.text = String(happinessFish)
//            barDisplay (animated: true)
//        case "Bird":
//            happinessBird = happinessBird + 1
//            happiness.text = String(happinessBird)
//            barDisplay (animated: true)
//        case "Bunny":
//            happinessBunny = happinessBunny + 1
//            happiness.text = String(happinessBunny)
//            barDisplay (animated: true)
//        default:
//            print("Some other character")
//        }
//
//    }
//    
//    
//    
//    
////display the values in bar
////    func barDisplay (animated: Bool) {
////        happinessCG = CGFloat((happinessValue/100))
////        foodCG = CGFloat((foodLevel/100))
////        if animated{
////            happinessBar.animateValue(to: (happinessCG)!)
////            foodBar.animateValue(to: (foodCG)!)
////    }
////        else{
////        happinessBar.value = (happinessCG)!
////
////        }
////        
////    }
//    
//    
//    
//    
////display animation
//    func barDisplay (animated: Bool) {
//        
//        switch currentPet{
//        case "Cat":
//        happinessCG = CGFloat((happinessCat/100))
//        foodCG = CGFloat((foodLevelCat/100))
//        if animated{
//            happinessBar.animateValue(to: (happinessCG)!)
//            foodBar.animateValue(to: (foodCG)!)
//        }
//        else{
//            happinessBar.value = (happinessCG)!
//            foodBar.value = (foodCG)!
//        }
//        case "Dog":
//            happinessCG = CGFloat((happinessDog/100))
//            foodCG = CGFloat((foodLevelDog/100))
//            if animated{
//                happinessBar.animateValue(to: (happinessCG)!)
//                foodBar.animateValue(to: (foodCG)!)
//            }
//            else{
//                happinessBar.value = (happinessCG)!
//                foodBar.value = (foodCG)!
//            }
//        case "Fish":
//            happinessCG = CGFloat((happinessFish/100))
//            foodCG = CGFloat((foodLevelFish/100))
//            if animated{
//                happinessBar.animateValue(to: (happinessCG)!)
//                foodBar.animateValue(to: (foodCG)!)
//            }
//            else{
//                happinessBar.value = (happinessCG)!
//                foodBar.value = (foodCG)!
//            }
//        case "Bunny":
//            happinessCG = CGFloat((happinessBunny/100))
//            foodCG = CGFloat((foodLevelBunny/100))
//            if animated{
//                happinessBar.animateValue(to: (happinessCG)!)
//                foodBar.animateValue(to: (foodCG)!)
//            }
//            else{
//                happinessBar.value = (happinessCG)!
//                foodBar.value = (foodCG)!
//            }
//        case "Bird":
//            happinessCG = CGFloat((happinessBird/100))
//            foodCG = CGFloat((foodLevelBird/100))
//            if animated{
//                happinessBar.animateValue(to: (happinessCG)!)
//                foodBar.animateValue(to: (foodCG)!)
//            }
//            else{
//                happinessBar.value = (happinessCG)!
//                foodBar.value = (foodCG)!
//            }
//        default:
//            print("Some other character")
//            
//            
//            
//        }
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//}
//
