//
//  ViewController.swift
//  virtualpet
//
//  Created by yang on 2017/9/11.
//  Copyright © 2017年 yang. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    private var currentPet: Pet! {
        didSet {
            updateLabel()
        }
    }
    
    //    outlets
    @IBOutlet weak var petImg: UIImageView!
    @IBOutlet weak var happiness: UILabel!
    @IBOutlet weak var food: UILabel!
    @IBOutlet weak var backgroundColor: UIView!
    @IBOutlet weak var happinessBar: displayView!
    @IBOutlet weak var foodBar: displayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Set Default
        currentPet = Pet(name: "Dog", party: .Dog)
        backgroundColor.backgroundColor = UIColor(red:0.30, green:0.84, blue:0.64, alpha:1.0)
        happinessBar.color = getRandomColor()
        foodBar.color = happinessBar.color
        updateLabel()
    }
    
    
        var approvalViewValue: Double = 50
        var foodValue: Double = 50
        var foodLevelCat: Double = 50
        var foodLevelDog: Double = 50
        var foodLevelBird: Double = 50
        var foodLevelFish: Double = 50
        var foodLevelBunny: Double = 50
        var happinessCat: Double = 50
        var happinessDog: Double = 50
        var happinessBird: Double = 50
        var happinessFish: Double = 50
        var happinessBunny: Double = 50
    

    
    //        retrieveData from Nsuserdefaults(dog as an example)
    func retrieveData() {
//        if let fCat = userDefults.value(forKey: "foodLevelCat") {
//            foodLevelCat = fCat as! Double
//            food.text = String(foodLevelCat)
//        } else {
//            //no highscore exists
//        }
//        
//        if let fBunny = userDefults.value(forKey: "foodLevelBunny") {
//            foodLevelBunny = fBunny as! Double
//            food.text = String(foodLevelBunny)
//        } else {
//            //no highscore exists
//        }
//        
        if let fDog = userDefults.value(forKey: "foodLevelDog") {
            food.text = String(describing: fDog)
        } else {
            print("not found")
        }
//        
//        if let fBird = userDefults.value(forKey: "foodLevelBird") {
//            //                food.text = String(describing: fBird)
//            //do something here when a highscore exists
//        } else {
//            //no highscore exists
//        }
//        
//        if let fFish = userDefults.value(forKey: "foodLevelFish") {
//            //                food.text = String(describing: fFish)
//            //do something here when a highscore exists
//        } else {
//            //no highscore exists
//        }
//        
//        if let hCat = userDefults.value(forKey: "happinessLevelCat") {
//            //                food.text = String(describing: hCat)
//            //do something here when a highscore exists
//        } else {
//            //no highscore exists
//        }
//        
//        if let hBunny = userDefults.value(forKey: "happinessLevelBunny") {
//            //                food.text = String(describing: hBunny)
//            //do something here when a highscore exists
//        } else {
//            //no highscore exists
//        }
//        
        if let hDog = userDefults.value(forKey: "happinessLevelDog") {
            happiness.text = String(describing: hDog)
        } else {
            print("not found")
        }
        
//        if let hBird = userDefults.value(forKey: "happinessLevelBird") {
//            //                food.text = String(describing: hBird)
//            //do something here when a highscore exists
//        } else {
//            //no highscore exists
//        }
////        
//        if let hFish = userDefults.value(forKey: "happinessLevelFish") {
//            //                food.text = String(describing: hFish)
//            //do something here when a highscore exists
//        } else {
//            //no highscore exists
//        }
//        
    }

//end of retrieving data func

    
    
    
    @IBAction func restore(_ sender: UIButton) {
        retrieveData()

    }
    
    

//update label for display
private func updateLabel() {
    switch currentPet.name {
    case "Cat":
        happiness.text = String(happinessCat)
        food.text = String(foodLevelCat)
        approvalViewValue = Double(happinessCat)/100
        foodValue = Double(foodLevelCat)/100
    case "Dog":
        happiness.text = String(happinessDog)
        food.text = String(foodLevelDog)
        approvalViewValue = Double(happinessDog)/100
        foodValue = Double(foodLevelDog)/100
        
    case "Fish":
        happiness.text = String(happinessFish)
        food.text = String(foodLevelFish)
        approvalViewValue = Double(happinessFish)/100
        foodValue = Double(foodLevelFish)/100


    case "Bird":
        happiness.text = String(happinessBird)
        food.text = String(foodLevelBird)
        approvalViewValue = Double(happinessBird)/100
        foodValue = Double(foodLevelBird)/100

    case "Bunny":
        happiness.text = String(happinessBunny)
        food.text = String(foodLevelBunny)
        approvalViewValue = Double(happinessBunny)/100
        foodValue = Double(foodLevelBunny)/100
    default:
        print("Some other character")
    }
        happinessBar.animateValue(to: CGFloat(approvalViewValue))
        foodBar.animateValue(to: CGFloat(foodValue))
    
    }
    

    
    //    store data for next time
    let userDefults = UserDefaults.standard //returns shared defaults object.
    func saveData () {
        userDefults.set(foodLevelCat, forKey: "foodLevelCat")
        userDefults.set(foodLevelBird, forKey: "foodLevelBird")
        userDefults.set(foodLevelBunny, forKey: "foodLevelBunny")
        userDefults.set(foodLevelFish, forKey: "foodLevelFish")
        userDefults.set(foodLevelDog, forKey: "foodLevelDog")
        userDefults.set(happinessBunny, forKey: "happinessLevelBunny")
        userDefults.set(happinessCat, forKey: "happinessLevelCat")
        userDefults.set(happinessBird, forKey: "happinessLevelBird")
        userDefults.set(happinessDog, forKey: "happinessLevelDog")
        userDefults.set(happinessFish, forKey: "happinessLevelFish")
    }
    
    
    
    
//play pet
@IBAction func play(_ sender: UIButton) {
                switch currentPet.name {
                case "Cat":
                    currentPet.makeAmericaGreatAgain()
                    happinessCat = currentPet.happinessValue
                    saveData()
                case "Dog":
                    currentPet.makeAmericaGreatAgain()
                    happinessDog = currentPet.happinessValue
                    saveData()
                case "Fish":
                    currentPet.makeAmericaGreatAgain()
                    happinessFish = currentPet.happinessValue
                    saveData()
                case "Bird":
                    currentPet.makeAmericaGreatAgain()
                    happinessBird = currentPet.happinessValue
                    saveData()
                case "Bunny":
                    currentPet.makeAmericaGreatAgain()
                    happinessBunny = currentPet.happinessValue
                    saveData()
                default:
                    print("Some other character")
                }
    updateLabel()
    }
    


//feed pet
@IBAction func feed(_ sender: UIButton) {
    switch currentPet.name {
    case "Cat":
        currentPet.tweet()
        foodLevelCat = currentPet.foodLevel
        saveData()
    case "Dog":
        currentPet.tweet()
        foodLevelDog = currentPet.foodLevel
        saveData()
    case "Fish":
        currentPet.tweet()
        foodLevelFish = currentPet.foodLevel
        saveData()
    case "Bird":
        currentPet.tweet()
        foodLevelBird = currentPet.foodLevel
        saveData()
    case "Bunny":
        currentPet.tweet()
        foodLevelBunny = currentPet.foodLevel
        saveData()
    default:
        print("Some other character")
    }
    updateLabel()
    }
    
    
    
    
//change current pet
@IBAction func cat(_ sender: UIButton) {
    currentPet = Pet(name: "Cat", party: .Cat)
    petImg.image = UIImage(named: "cat")
    backgroundColor.backgroundColor = UIColor(red:0.89, green:0.44, blue:0.44, alpha:1.0)
    happinessBar.color = getRandomColor()
    foodBar.color = happinessBar.color
    updateLabel()
    }
@IBAction func bird(_ sender: UIButton) {
    currentPet = Pet(name: "Bird", party: .Bird)
    petImg.image = UIImage(named: "bird")
    backgroundColor.backgroundColor = UIColor(red:0.86, green:0.92, blue:0.20, alpha:1.0)
    happinessBar.color = getRandomColor()
    foodBar.color = happinessBar.color
    updateLabel()
    }
@IBAction func bunny(_ sender: UIButton) {
    currentPet = Pet(name: "Bunny", party: .Bunny)
    petImg.image = UIImage(named: "bunny")
    backgroundColor.backgroundColor = UIColor.blue
    happinessBar.color = getRandomColor()
    foodBar.color = happinessBar.color
    updateLabel()
    }
@IBAction func dog(_ sender: UIButton) {
    currentPet = Pet(name: "Dog", party: .Dog)
    petImg.image = UIImage(named: "dog")
    backgroundColor.backgroundColor = UIColor(red:0.30, green:0.84, blue:0.64, alpha:1.0)
    happinessBar.color = getRandomColor()
    foodBar.color = happinessBar.color
    updateLabel()
    }
@IBAction func fish(_ sender: UIButton) {
    currentPet = Pet(name: "Fish", party: .Fish)
    petImg.image = UIImage(named: "fish")
    backgroundColor.backgroundColor = UIColor(red:0.93, green:0.54, blue:0.89, alpha:1.0)
    happinessBar.color = getRandomColor()
    foodBar.color = happinessBar.color
    updateLabel()
    }
    
    
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
//    //    generates a random color
    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
//    //    color generator ref https://stackoverflow.com/questions/29779128/how-to-make-a-random-background-color-with-swift
    
}

