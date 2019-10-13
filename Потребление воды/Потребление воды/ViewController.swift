//
//  ViewController.swift
//  Потребление воды
//
//  Created by Дарья Хомякова on 09.10.2019.
//  Copyright © 2019 Дарья Хомякова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var drinks: [Int] = []

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var flowerImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
    }

    @IBAction func addDrink(_ sender: AnyObject) {
        if sender.tag == 1{
            
            drinks.append(100)
            update()
            print(drinks)
        }else if sender.tag == 2{
            
            drinks.append(250)
            //print(drinks)
            update()
        }else{
            
            drinks.append(350)
            update()
            //print(drinks)
        }
    }
    func save(){
        UserDefaults.standard.set(drinks, forKey: "drinks")
        UserDefaults.standard.synchronize()
    }
    
    func load() {
        if let saved = UserDefaults.standard.array(forKey: "drinks") as? [Int]{
            drinks = saved
            print(drinks)
            update()
        } else{
            drinks.removeAll()
            update()
            
        }
    }
    
    @IBAction func cancelDrink(_ sender: UIButton) {
        drinks.removeLast()
        update()
    }
    
    
    func update(){
        
        progressLabel.text = "\(drinks.reduce(0, +))/2000"
        if drinks.reduce(0, +) >= 0 && drinks.reduce(0, +) < 400{
            flowerImg.image = UIImage(named: "flower1")
            flowerImg.frame.origin.y = 249
            flowerImg.frame.origin.x = 22
            flowerImg.frame.size.height = 114
            flowerImg.frame.size.width = 220
            
        } else if drinks.reduce(0, +) >= 400 && drinks.reduce(0, +) < 800{
            flowerImg.image = UIImage(named: "flower2")
            flowerImg.frame.origin.y = 219
            flowerImg.frame.origin.x = 22
            flowerImg.frame.size.height = 145
            flowerImg.frame.size.width = 220
            
        } else if drinks.reduce(0, +) >= 800 && drinks.reduce(0, +) < 1200{
            flowerImg.image = UIImage(named: "flower3")
            flowerImg.frame.origin.y = 148
            flowerImg.frame.origin.x = 15
            flowerImg.frame.size.height = 216
            flowerImg.frame.size.width = 220
            
        } else if drinks.reduce(0, +) >= 1200 && drinks.reduce(0, +) < 1600{
            flowerImg.image = UIImage(named: "flower4")
            flowerImg.frame.origin.y = 0
            flowerImg.frame.origin.x = 15
            flowerImg.frame.size.height = 364
            flowerImg.frame.size.width = 220
            
        } else if drinks.reduce(0, +) >= 1600 && drinks.reduce(0, +) >= 2000{
            flowerImg.image = UIImage(named: "flower5")
            flowerImg.frame.origin.y = 0
            flowerImg.frame.origin.x = 15
            flowerImg.frame.size.height = 364
            flowerImg.frame.size.width = 220
        }
        save()
        
    }

    
}

