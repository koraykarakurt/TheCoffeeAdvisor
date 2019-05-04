//
//  ViewController.swift
//  The Coffee Advisor
//
//  Created by Koray Karakurt on 2.03.2019.
//  Copyright © 2019 Koray Karakurt. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



    


import UIKit
import UIMultiPicker

class ViewController2: UIViewController {
    
    static let TASTES = [

        "No Milk"               ,
        "No Sugar"              ,
        //"No Caffeine"         ,
        
        //"Blonde Roast"        ,
        //"Medium Roast"        ,
        //"Dark Roast"          ,

        "Foam"                  ,
        "Cream"                 ,
        "Extra Shot"            ,
        "Iced Coffee"           ,
        //"Cold Brew"           ,
        
        "Kcal < 50"             ,
        "Kcal < 100"            ,
        "Kcal < 200"            ,
        
    ];
    
    @IBOutlet weak var tastesPicker: UIMultiPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let saved_selectedIndexes = UserDefaults.standard.integer(forKey: "UIMultiPickerIndexes")
        let defaults = UserDefaults.standard
        let saved_selectedIndexes = defaults.object(forKey:"UIMultiPickerIndexes") as? [Int] ?? [Int]()
        print(saved_selectedIndexes)
        
        
        
        tastesPicker.options = ViewController2.TASTES
        tastesPicker.selectedIndexes = saved_selectedIndexes
        //tastesPicker.selectedIndexes = [saved_selectedIndexes]

        tastesPicker.addTarget(self, action: #selector(ViewController2.selected(_:)), for: .valueChanged)
        
        tastesPicker.color = .gray
        tastesPicker.tintColor = .black
        tastesPicker.font = .systemFont(ofSize: 24, weight: .bold)
        
        tastesPicker.highlight(2, animated: false) // centering "Bitter"
    }

    @objc func selected(_ sender: UIMultiPicker) {
        UserDefaults.standard.set(sender.selectedIndexes, forKey: "UIMultiPickerIndexes")
        print(sender.selectedIndexes)
    }
}


class ViewController3: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    var V3_saved_selectedIndexes = UserDefaults.standard.object(forKey:"UIMultiPickerIndexes") as? [Int] ?? [Int]()
    

    
    
    
    //let optionArray = ["Blonde Roast", "Medium Roast", "Dark Roast", "Milky", "Sugar-Free", "Kcal < 50", "Kcal < 100", "Kcal < 200"]
    
   class MyCoffeeMenu {

        var coffeeMenuNames  = [""]
        var coffeeMenuKcals  = [""]

//        init(coffeeMenuNames: String, coffeeMenuKcals: String) {
//            self.coffeeMenuNames = ["a"]
//            self.coffeeMenuKcals = ["77"]
//
//        }

    }

    var myVariableMenu = MyCoffeeMenu()
    
    
    
    
  

    //coffeeMenu.coffeeMenuNames = ["Cortado"]

    //var coffeeMenu = [""]
    
    var coffeeMenu = [""]
    

   
    
    
    //Pre-setup IBOutlets
    
    @IBOutlet weak var optionPicker: UIPickerView!
    
    //@IBOutlet weak var myLabel: UILabel!
    
    //FUNCTIONS
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
    coffeeMenu =
        [
        "Lungo"                        ,
        "Espresso"                     ,
        "Macchiato"                    ,
        "Ristretto"                    ,
        "Americano"                    ,
            
        "Latte"                        ,//milk
        "Misto"                        ,//milk
        "Cappucino"                    ,//milk
        "Flat White"                   ,//milk
        "Cortado"                      ,//milk

        //"Ristretto Bianco"           ,
        
        "Mocha"                        ,//milk+sugar
        "Frappuccino"                  ,//milk+sugar
        "Caramel Macchiato"            ,//milk+sugar
        "White Chocolate Mocha"        ,//milk+sugar
        
        "Iced Latte"                   ,//milk
        "Iced Mocha"                   ,//milk+sugar
        "Iced Americano"               ,
        "Iced Caramel Macchiato"       ,//milk+sugar
        "Iced White Chocolate Mocha"    //milk+sugar
        ]
        
        if V3_saved_selectedIndexes.contains(0)  { //no milk and sugar case
            coffeeMenu.removeAll(keepingCapacity: false)
            coffeeMenu.append("Lungo")
            coffeeMenu.append("Espresso")
            coffeeMenu.append("Macchiato")
            coffeeMenu.append("Ristretto")
            coffeeMenu.append("Americano")
            coffeeMenu.append("Iced Americano")
        }
        else if V3_saved_selectedIndexes.contains(1)  { //no sugar case
            coffeeMenu.removeAll(keepingCapacity: false)
            coffeeMenu.append("Lungo")
            coffeeMenu.append("Espresso")
            coffeeMenu.append("Macchiato")
            coffeeMenu.append("Ristretto")
            coffeeMenu.append("Americano")
            
            coffeeMenu.append("Latte")
            coffeeMenu.append("Misto")
            coffeeMenu.append("Cappucino")
            coffeeMenu.append("Flat White")
            coffeeMenu.append("Cortado")
            
            coffeeMenu.append("Iced Americano")
            coffeeMenu.append("Iced Latte")
            
        }
        
        if V3_saved_selectedIndexes.contains(5) && V3_saved_selectedIndexes.contains(0)    { // iced and no milk
            coffeeMenu.removeAll(keepingCapacity: false)
            coffeeMenu.append("Iced Americano")
        }
        
        else if V3_saved_selectedIndexes.contains(5) && V3_saved_selectedIndexes.contains(1)  { // iced and no sugar
            coffeeMenu.removeAll(keepingCapacity: false)
            coffeeMenu.append("Iced Latte")
            coffeeMenu.append("Iced Americano")
        }
        
        else if V3_saved_selectedIndexes.contains(5)  {
            coffeeMenu.removeAll(keepingCapacity: false)
            coffeeMenu.append("Iced Latte")
            coffeeMenu.append("Iced Mocha")
            coffeeMenu.append("Iced Americano")
            coffeeMenu.append("Iced Caramel Macchiato")
            coffeeMenu.append("Iced White Chocolate Mocha")
        }
        

        return coffeeMenu.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coffeeMenu[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let titleData = coffeeMenu[0][row]
//        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 24.0)!,NSAttributedString.Key.foregroundColor:UIColor.black])
//        return myTitle
//    }
//
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        myLabel.text = coffeeMenu[0][row]
//    }
    
//
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = coffeeMenu[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 28.0)!,NSAttributedString.Key.foregroundColor:UIColor.black])
        pickerLabel.attributedText = myTitle
        
        //color  and center the label's background
        //let hue = CGFloat(row)/CGFloat(coffeeMenu[0].count)
        //pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)
        pickerLabel.backgroundColor = UIColor.brown
        pickerLabel.textAlignment = .center
        return pickerLabel
        
        
    }
    
    
    //////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(mymm.coffeeMenuNames)
        //print(mymm.coffeeMenuKcals)
        
        optionPicker.delegate = self
        optionPicker.dataSource = self
        //optionPicker.selectRow((coffeeMenu.count)/2, inComponent: 0, animated: false)
        
    }
    
    
}




////

//
//let coffeeMenu: [[String]] =
//    [
//
//        [
//
//            "Cortado"                      ,
//            "Espresso"                     ,
//            "Macchiato"                    ,
//            "Ristretto"                    ,
//            "Americano"                    ,
//
//            "Latte"                        ,
//            "Misto"                        ,
//            "Cappucino"                    ,
//            "Flat White"                   ,
//            "Ristretto Bianco"             ,
//
//            "Mocha"                        ,
//            "Frappuccino"                  ,
//            "Caramel Macchiato"            ,
//            "White Chocolate Mocha"        ,
//
//            "Iced Latte"                   ,
//            "Iced Mocha"                   ,
//            "Iced Americano"               ,
//            "Iced Caramel Macchiato"       ,
//            "Iced White Chocolate Mocha"   ],
//
//        [" 15 kcal",
//         " 15 kcal",
//         " 15 kcal",
//         " 15 kcal",
//         " 15 kcal",
//
//         "150 kcal",
//         "150 kcal",
//         "150 kcal",
//         "150 kcal",
//         "150 kcal",
//
//         "350 kcal",
//         "350 kcal",
//         "350 kcal",
//         "350 kcal",
//
//         "150 kcal",
//         "350 kcal",
//         " 15 kcal",
//         "350 kcal",
//         "350 kcal"]
//
//];
//
//
//
