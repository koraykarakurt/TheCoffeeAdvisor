
//  ViewController.swift
//  Coffee Advisor
//
//  Created by Meric Koray Karakurt on 19.05.2019
//  Copyright © 2019 Meric Koray Karakurt. All rights reserved.
//

import UIKit
import UIMultiPicker

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var MCA: UIButton!
    @IBOutlet weak var MCO: UIButton!
    
    let screenWidth  = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MCA.layer.cornerRadius = screenWidth * 0.5 * 0.8
        self.MCO.layer.cornerRadius = screenWidth * 0.5 * 0.4
    }
}

class ViewController2: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    static let TASTES = [
        "Milk-free"                 ,//0
        "Glucose-free"              ,//1
        "Foam"                      ,//2
        "Cream"                     ,//3
        "Iced Coffee"               ,//4
        "Espresso Shots > 1"        ,//5
        "Espresso Shots > 2"        ,//6
        "Calories < 50 Kcal"        ,//7
        "Calories < 100 Kcal"       ,//8
        "Calories < 200 Kcal"        //9
    ];
    
    @IBOutlet weak var tastesPicker: UIMultiPicker!
    @IBOutlet weak var BVC2: UIButton!
    
    let screenWidth  = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let saved_selectedIndexes = defaults.object(forKey:"UIMultiPickerIndexes") as? [Int] ?? [Int]()
        
        self.tastesPicker.layer.cornerRadius =  screenWidth * 0.5 * 0.8
        self.BVC2.layer.cornerRadius = screenWidth * 0.5 * 0.4
        
        tastesPicker.options = ViewController2.TASTES
        tastesPicker.selectedIndexes = saved_selectedIndexes
        tastesPicker.addTarget(self, action: #selector(ViewController2.selected(_:)), for: .valueChanged)
        
        tastesPicker.color = .darkGray
        tastesPicker.tintColor = .black
        tastesPicker.font  = UIFont(name: "Georgia", size: 30)!
        tastesPicker.highlight(2, animated: true)
    }
    
    
    
    @objc func selected(_ sender: UIMultiPicker) {
        UserDefaults.standard.set(sender.selectedIndexes, forKey: "UIMultiPickerIndexes")
        //print(sender.selectedIndexes)
    }
}



class ViewController3: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var BVC3: UIButton!
    

    @IBOutlet weak var DVC3: UIButton!
    
    var V3_saved_selectedIndexes = UserDefaults.standard.object(forKey:"UIMultiPickerIndexes") as? [Int] ?? [Int]()
    
    class MyCoffee {
        var coffeeName          = ""
        var coffeeKcal          = ""
        var coffeeCaffeine      = ""
        var hasMilk             = false
        var coffeeMilk          = ""
        var hasSugar            = false
        var hasFoam             = false
        var coffeeFoam          = ""
        var hasCream            = false
        var coffeeCream         = ""
        var hasKcalLessThan50   = false
        var hasKcalLessThan100  = false
        var hasKcalLessThan200  = false
        var hasMoreThan1shot    = false
        var hasMoreThan2shot    = false
        var hasIce              = false
        
        init(coffeeName: String, coffeeKcal: String, coffeeCaffeine: String, hasMilk: Bool, coffeeMilk: String, hasSugar: Bool, hasFoam: Bool, coffeeFoam: String, hasCream: Bool, coffeeCream: String, hasKcalLessThan50: Bool, hasKcalLessThan100: Bool, hasKcalLessThan200: Bool, hasMoreThan1shot: Bool, hasMoreThan2shot: Bool, hasIce: Bool) {
            
            self.coffeeName         = coffeeName
            self.coffeeKcal         = coffeeKcal
            self.coffeeCaffeine     = coffeeCaffeine
            self.hasMilk            = hasMilk
            self.coffeeMilk         = coffeeMilk
            self.hasSugar           = hasSugar
            self.hasFoam            = hasFoam
            self.coffeeFoam         = coffeeFoam
            self.hasCream           = hasCream
            self.coffeeCream        = coffeeCream
            self.hasKcalLessThan50  = hasKcalLessThan50
            self.hasKcalLessThan100 = hasKcalLessThan100
            self.hasKcalLessThan200 = hasKcalLessThan200
            self.hasMoreThan1shot   = hasMoreThan1shot
            self.hasMoreThan2shot   = hasMoreThan2shot
            self.hasIce             = hasIce
            
        }
    }
    
    let espresso                    = MyCoffee(coffeeName        : "Espresso",
                                               coffeeKcal        : "5 Kcal",
                                               coffeeCaffeine    : "75 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : false,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let espressoDoppio              = MyCoffee(coffeeName        : "Espresso Doppio",
                                               coffeeKcal        : "10 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let ristretto                   = MyCoffee(coffeeName        : "Ristretto",
                                               coffeeKcal        : "6 Kcal",
                                               coffeeCaffeine    : "90 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let macchiato                   = MyCoffee(coffeeName        : "Macchiato",
                                               coffeeKcal        : "12 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "5 ml",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    //not sure about cortado
    let cortado                     = MyCoffee(coffeeName        : "Cortado",
                                               coffeeKcal        : "30 Kcal",
                                               coffeeCaffeine    : "150 mg",// 60 ml = 10 Kcal
                                               hasMilk           : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "30 ml",// 15 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let latte                       = MyCoffee(coffeeName        : "Latte",
                                               coffeeKcal        : "220 Kcal",
                                               coffeeCaffeine    : "150 mg",//60 ml = 10 Kcal
                                               hasMilk           : true,
                                               coffeeMilk        : "360 ml",//180 Kcal
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "30 ml",//7.5 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let icedLatte                   = MyCoffee(coffeeName        : "Iced Latte",
                                               coffeeKcal        : "150 Kcal",
                                               coffeeCaffeine    : "150 mg",//10 Kcal (60 ml)
                                               hasMilk           : true,
                                               coffeeMilk        : "240 ml",//120 Kcal
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "30 ml",//7.5 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    let cappucino                   = MyCoffee(coffeeName        : "Cappucino",
                                               coffeeKcal        : "145 Kcal",
                                               coffeeCaffeine    : "150 mg",//= 60 ml (2 shot) = 10 Kcal
                                               hasMilk           : true,
                                               coffeeMilk        : "180 ml",//90 Kcal
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "180 ml",//45 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let americano                   = MyCoffee(coffeeName        : "Americano",
                                               coffeeKcal        : "15 Kcal",
                                               coffeeCaffeine    : "225 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : true,
                                               hasIce            : false)
    
    let icedAmericano               = MyCoffee(coffeeName        : "Iced Americano",
                                               coffeeKcal        : "15 Kcal",
                                               coffeeCaffeine    : "225 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    let misto                       = MyCoffee(coffeeName        : "Misto",
                                               coffeeKcal        : "130 Kcal",
                                               coffeeCaffeine    : "150 mg",//60 ml = 10 Kcal
                                               hasMilk           : true,
                                               coffeeMilk        : "220 ml",//110 Kcal
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let flatWhite                   = MyCoffee(coffeeName        : "Flat White",
                                               coffeeKcal        : "220 Kcal",
                                               coffeeCaffeine    : "190 mg",//75 ml = 15 Kcal
                                               hasMilk           : true,
                                               coffeeMilk        : "360 ml",//175 Kcal
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : true,
                                               hasIce            : false)
    
    let mocha                       = MyCoffee(coffeeName        : "Mocha",
                                               coffeeKcal        : "400 Kcal",
                                               coffeeCaffeine    : "175 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "50 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : true,
                                               hasIce            : false)
    
    let icedMocha                   = MyCoffee(coffeeName        : "Iced Mocha",
                                               coffeeKcal        : "350 Kcal",
                                               coffeeCaffeine    : "175 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "30 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : true,
                                               hasIce            : true)
    
    let whiteChocolateMocha         = MyCoffee(coffeeName        : "White Chocolate Mocha",
                                               coffeeKcal        : "440 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "120 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "60 ml",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let icedWhiteChocolateMocha     = MyCoffee(coffeeName        : "Iced White Chocolate Mocha",
                                               coffeeKcal        : "420 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "105 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "60 ml",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    let caramelMacchiato            = MyCoffee(coffeeName        : "Caramel Macchiato",
                                               coffeeKcal        : "280 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "90 ml",
                                               hasSugar          : true,
                                               hasFoam           : true,
                                               coffeeFoam        : "20 ml",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let icedCaramelMacchiato        = MyCoffee(coffeeName        : "Iced Caramel Macchiato",
                                               coffeeKcal        : "270 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "75 ml",
                                               hasSugar          : true,
                                               hasFoam           : true,
                                               coffeeFoam        : "15 ml",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    let frappuccino                 = MyCoffee(coffeeName        : "Frappuccino",
                                               coffeeKcal        : "240 Kcal",
                                               coffeeCaffeine    : "95 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "100 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "30 ml",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    var coffeeMenuAll: [MyCoffee] = []
    var coffeeMenu = [""]
    
    @IBOutlet weak var optionPicker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coffeeMenuAll.removeAll(keepingCapacity: false)
        
        coffeeMenuAll.append(espresso)
        coffeeMenuAll.append(ristretto)
        coffeeMenuAll.append(americano)
        coffeeMenuAll.append(espressoDoppio)
        
        coffeeMenuAll.append(latte)
        coffeeMenuAll.append(misto)
        coffeeMenuAll.append(cortado)
        coffeeMenuAll.append(macchiato)
        coffeeMenuAll.append(cappucino)
        coffeeMenuAll.append(flatWhite)
        
        coffeeMenuAll.append(mocha)
        coffeeMenuAll.append(caramelMacchiato)
        coffeeMenuAll.append(whiteChocolateMocha)
        
        coffeeMenuAll.append(icedLatte)
        coffeeMenuAll.append(icedMocha)
        coffeeMenuAll.append(frappuccino)
        coffeeMenuAll.append(icedAmericano)
        coffeeMenuAll.append(icedCaramelMacchiato)
        coffeeMenuAll.append(icedWhiteChocolateMocha)
        
        coffeeMenu = [""]
        for i in 0 ..< coffeeMenuAll.count {
            coffeeMenu.append(coffeeMenuAll[i].coffeeName)
        }
        
        if V3_saved_selectedIndexes.contains(0)  { //"Milk-free"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasMilk == false })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(1)  { //"Glucose-free"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasSugar == false })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(2)  { //"Foam"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasFoam == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(3)  { //"Cream"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasCream == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(5)  { //"Espresso Shot > 1"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasMoreThan1shot == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(6)  { //"Espresso Shot > 2"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasMoreThan2shot == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(4)  { //"Iced Coffee"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasIce == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(9)  { //"Kcal < 200"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasKcalLessThan200 == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(8)  { //"Kcal < 100"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasKcalLessThan100 == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(7)  { //"Kcal < 50"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasKcalLessThan50 == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if coffeeMenu.count > 0 {
            coffeeMenu.remove(at: 0)
        }
        if coffeeMenuAll.count>0
        {
            UserDefaults.standard.set(coffeeMenuAll.count, forKey: "UIPickerElements")
        }
        else
        {
            UserDefaults.standard.set(0, forKey: "UIPickerElements")
        }
        return coffeeMenu.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print(row)
        if row >= 0 && coffeeMenuAll.count>0
        {
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeName     , forKey: "UIPickerName")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeKcal     , forKey: "UIPickerKcal")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeine , forKey: "UIPickerCaffeine")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeMilk     , forKey: "UIPickerMilk")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeFoam     , forKey: "UIPickerFoam")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeCream    , forKey: "UIPickerCream")
        }
        else
        {
            UserDefaults.standard.set("-", forKey: "UIPickerName")
            UserDefaults.standard.set("-", forKey: "UIPickerKcal")
            UserDefaults.standard.set("-", forKey: "UIPickerCaffeine")
            UserDefaults.standard.set("-", forKey: "UIPickerMilk")
            UserDefaults.standard.set("-", forKey: "UIPickerFoam")
            UserDefaults.standard.set("-", forKey: "UIPickerCream")
        }
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //print(row)
        if row >= 0 && coffeeMenuAll.count>0
        {
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeName     , forKey: "UIPickerName")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeKcal     , forKey: "UIPickerKcal")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeine , forKey: "UIPickerCaffeine")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeMilk     , forKey: "UIPickerMilk")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeFoam     , forKey: "UIPickerFoam")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeCream    , forKey: "UIPickerCream")
        }
        else
        {
            UserDefaults.standard.set("-", forKey: "UIPickerName")
            UserDefaults.standard.set("-", forKey: "UIPickerKcal")
            UserDefaults.standard.set("-", forKey: "UIPickerCaffeine")
            UserDefaults.standard.set("-", forKey: "UIPickerMilk")
            UserDefaults.standard.set("-", forKey: "UIPickerFoam")
            UserDefaults.standard.set("-", forKey: "UIPickerCream")
        }
        let pickerLabel = UILabel()
        let titleData = coffeeMenu[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 28.0)!,NSAttributedString.Key.foregroundColor:UIColor.black])
        pickerLabel.attributedText = myTitle
        pickerLabel.backgroundColor = UIColor.init(red: 250.0/255.0, green: 235.0/255.0, blue: 215.0/255.0, alpha: 1.0)
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    
    let screenWidth  = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionPicker.delegate = self
        optionPicker.dataSource = self
        self.DVC3.layer.cornerRadius =  screenWidth * 0.5 * 0.4
        self.BVC3.layer.cornerRadius = screenWidth * 0.5 * 0.4

    }
    
}



class ViewController4: UIViewController {
    @IBOutlet weak var BVC4: UIButton!
    override var preferredStatusBarStyle    : UIStatusBarStyle {
        return .lightContent
    }
    @IBOutlet weak var labelCoffeeName       : UILabel!
    @IBOutlet weak var labelCoffeeKcal       : UILabel!
    @IBOutlet weak var labelCoffeeSize       : UILabel!
    @IBOutlet weak var labelCoffeeCaffeine   : UILabel!
    @IBOutlet weak var labelCoffeeMilk       : UILabel!
    @IBOutlet weak var labelCoffeeFoam       : UILabel!
    @IBOutlet weak var labelCoffeeCream      : UILabel!
    
    
    var V4_saved_selectedCoffeeName          = "-"
    var V4_saved_selectedCoffeeSize          = "-"
    var V4_saved_selectedCoffeeKcal          = "-"
    var V4_saved_selectedCoffeeCaffeine      = "-"
    var V4_saved_selectedCoffeeMilk          = "-"
    var V4_saved_selectedCoffeeFoam          = "-"
    var V4_saved_selectedCoffeeCream         = "-"
    
    let screenWidth  = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.BVC4.layer.cornerRadius =  screenWidth * 0.5 * 0.4
        
        //print( UserDefaults.standard.object(forKey:"UIPickerElements") as? Int ?? Int())
        if UserDefaults.standard.object(forKey:"UIPickerElements") as? Int ?? Int() > 0
        {
        V4_saved_selectedCoffeeName          = UserDefaults.standard.object(forKey:"UIPickerName")     as? String ?? String()
        V4_saved_selectedCoffeeSize          = UserDefaults.standard.object(forKey:"UIPickerSizes")    as? String ?? String()
        V4_saved_selectedCoffeeKcal          = UserDefaults.standard.object(forKey:"UIPickerKcal")     as? String ?? String()
        V4_saved_selectedCoffeeCaffeine      = UserDefaults.standard.object(forKey:"UIPickerCaffeine") as? String ?? String()
        V4_saved_selectedCoffeeMilk          = UserDefaults.standard.object(forKey:"UIPickerMilk")     as? String ?? String()
        V4_saved_selectedCoffeeFoam          = UserDefaults.standard.object(forKey:"UIPickerFoam")     as? String ?? String()
        V4_saved_selectedCoffeeCream         = UserDefaults.standard.object(forKey:"UIPickerCream")    as? String ?? String()
        }
        
        labelCoffeeName.font                 = UIFont(name: "Georgia-Bold", size: 25)!
        labelCoffeeName.textAlignment        = .center
        labelCoffeeName.text                 = "\(V4_saved_selectedCoffeeName)"
        labelCoffeeName.layer.cornerRadius   = 10
        labelCoffeeName.layer.masksToBounds  = true
        labelCoffeeName.layer.maskedCorners  = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        labelCoffeeSize.font                 = UIFont(name: "Georgia", size: 26)!
        labelCoffeeSize.textAlignment        = .center
        if V4_saved_selectedCoffeeName=="Espresso"
        {
            labelCoffeeSize.text             = "Size: 30 ml (1 oz)"
        }
        else if V4_saved_selectedCoffeeName=="Ristretto"
            
        {
            labelCoffeeSize.text             = "Size: 22.5 ml (.75 oz)"
        }

        else if  V4_saved_selectedCoffeeName=="Macchiato" || V4_saved_selectedCoffeeName=="Espresso Doppio"

        {
            labelCoffeeSize.text             = "Size: 60 ml (2 oz)"
        }
        else if  V4_saved_selectedCoffeeName=="Cortado"
            
        {
            labelCoffeeSize.text             = "Size: 90 ml (3 oz)"
        }
        else if  V4_saved_selectedCoffeeName=="-"
            
        {
            labelCoffeeSize.text             = "Size: -"
        }
        else
        {
            labelCoffeeSize.text             = "Size: 480 ml (Grande)"
        }
        labelCoffeeKcal.font                 = UIFont(name: "Georgia", size: 26)!
        labelCoffeeKcal.textAlignment        = .center
        labelCoffeeKcal.text                 = "Calories: \(V4_saved_selectedCoffeeKcal)"
        labelCoffeeCaffeine.font             = UIFont(name: "Georgia", size: 26)!
        labelCoffeeCaffeine.textAlignment    = .center
        labelCoffeeCaffeine.text             = "Caffeine: \(V4_saved_selectedCoffeeCaffeine)"
        labelCoffeeMilk.font                 = UIFont(name: "Georgia", size: 26)!
        labelCoffeeMilk.textAlignment        = .center
        labelCoffeeMilk.text                 = "Steamed Milk: \(V4_saved_selectedCoffeeMilk)"
        labelCoffeeFoam.font                 = UIFont(name: "Georgia", size: 26)!
        labelCoffeeFoam.textAlignment        = .center
        labelCoffeeFoam.text                 = "Foamed Milk: \(V4_saved_selectedCoffeeFoam)"
        labelCoffeeCream.font                = UIFont(name: "Georgia", size: 26)!
        labelCoffeeCream.textAlignment       = .center
        labelCoffeeCream.text                = "Cream: \(V4_saved_selectedCoffeeCream)"
        labelCoffeeCream.layer.cornerRadius  = 10
        labelCoffeeCream.layer.masksToBounds = true
        labelCoffeeCream.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }
}
