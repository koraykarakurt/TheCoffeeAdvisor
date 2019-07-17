
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
        //print(screenHeight)
        //print(screenWidth)
        //print(screenHeight/screenWidth)
    }
//dismissDetailLeft()
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
        "Calories < 200 Kcal"       ,//9
        "360 ml (Tall)"             ,//10
        "480 ml (Grande)"           ,//11
        "720 ml (Venti)"             //12
    ];
    
    @IBOutlet weak var tastesPicker: UIMultiPicker!
    @IBOutlet weak var BVC2: UIButton!
    
    @IBAction func BVC2(_ sender: UIButton) {
        dismiss (animated: true, completion: nil) 
    }
    
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
        tastesPicker.font  = UIFont(name: "Georgia", size: 28)!
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
    
    @IBAction func BVC3(_ sender: UIButton) {dismiss(animated: true, completion: nil)}
    @IBOutlet weak var DVC3: UIButton!
    
    var V3_saved_selectedIndexes = UserDefaults.standard.object(forKey:"UIMultiPickerIndexes") as? [Int] ?? [Int]()
    
    class MyCoffee {
        var coffeeName          = ""
        var coffeeKcal          = ""
        var coffeeCaffeine      = ""
        var hasMilk             = false
        var hasSmallSize        = false
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
        
        init(coffeeName: String, coffeeKcal: String, coffeeCaffeine: String, hasMilk: Bool, hasSmallSize: Bool, coffeeMilk: String, hasSugar: Bool, hasFoam: Bool, coffeeFoam: String, hasCream: Bool, coffeeCream: String, hasKcalLessThan50: Bool, hasKcalLessThan100: Bool, hasKcalLessThan200: Bool, hasMoreThan1shot: Bool, hasMoreThan2shot: Bool, hasIce: Bool) {
            
            self.coffeeName         = coffeeName
            self.coffeeKcal         = coffeeKcal
            self.coffeeCaffeine     = coffeeCaffeine
            self.hasMilk            = hasMilk
            self.hasSmallSize       = hasSmallSize
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
                                               coffeeKcal        : "5",
                                               coffeeCaffeine    : "75",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
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
    
    let turkishCoffee                    = MyCoffee(coffeeName   : "Turkish Coffee",
                                               coffeeKcal        : "4",
                                               coffeeCaffeine    : "60",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
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
                                               coffeeKcal        : "10",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
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
                                               coffeeKcal        : "7",
                                               coffeeCaffeine    : "110",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
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
    
    let lungo                       = MyCoffee(coffeeName        : "Lungo",
                                               coffeeKcal        : "10",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
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
    
    let blackEye                       = MyCoffee(coffeeName     : "Black Eye",
                                               coffeeKcal        : "14",
                                               coffeeCaffeine    : "220",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
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
    
    let macchiato                   = MyCoffee(coffeeName        : "Macchiato",
                                               coffeeKcal        : "12",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "5",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let conPanna                   = MyCoffee(coffeeName        : "Con Panna",
                                               coffeeKcal        : "323",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "90",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let cortado                     = MyCoffee(coffeeName        : "Cortado",
                                               coffeeKcal        : "30",
                                               coffeeCaffeine    : "150",// 60 ml = 10 Kcal
                                               hasMilk           : true,
                                               hasSmallSize      : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "30",// 15 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
   
    let cafeCreme                       = MyCoffee(coffeeName    : "Café Crème",
                                               coffeeKcal        : "114",
                                               coffeeCaffeine    : "150",//60 ml = 10 Kcal
                                               hasMilk           : false,
                                               hasSmallSize      : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "30",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let latte                       = MyCoffee(coffeeName        : "Latte",
                                               coffeeKcal        : "220",
                                               coffeeCaffeine    : "150",//60 ml = 10 Kcal
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "360",//180 Kcal
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "30",//7.5 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let icedLatte                   = MyCoffee(coffeeName        : "Iced Latte",
                                               coffeeKcal        : "150",
                                               coffeeCaffeine    : "150",//10 Kcal (60 ml)
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "240",//120 Kcal
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "30",//7.5 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    let cappucino                   = MyCoffee(coffeeName        : "Cappucino",
                                               coffeeKcal        : "145",
                                               coffeeCaffeine    : "150",//= 60 ml (2 shot) = 10 Kcal
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "180",//90 Kcal
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "180",//45 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let americano                   = MyCoffee(coffeeName        : "Americano",
                                               coffeeKcal        : "15",
                                               coffeeCaffeine    : "225",
                                               hasMilk           : false,
                                               hasSmallSize      : false,
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
                                               coffeeKcal        : "15",
                                               coffeeCaffeine    : "225",
                                               hasMilk           : false,
                                               hasSmallSize      : false,
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
                                               coffeeKcal        : "130",
                                               coffeeCaffeine    : "150",//60 ml = 10 Kcal
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "220",//110 Kcal
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
                                               coffeeKcal        : "220",
                                               coffeeCaffeine    : "190",//75 ml = 15 Kcal
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "360",//175 Kcal
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
                                               coffeeKcal        : "400",
                                               coffeeCaffeine    : "175",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "50",
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
    
    let affogato                       = MyCoffee(coffeeName     : "Affogato",
                                               coffeeKcal        : "196",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    let icedMocha                   = MyCoffee(coffeeName        : "Iced Mocha",
                                               coffeeKcal        : "350",
                                               coffeeCaffeine    : "175",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "30",
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
                                               coffeeKcal        : "440",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "120",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "60",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let icedWhiteChocolateMocha     = MyCoffee(coffeeName        : "Iced White Chocolate Mocha",
                                               coffeeKcal        : "420",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "105",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "60",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    let caramelMacchiato            = MyCoffee(coffeeName        : "Caramel Macchiato",
                                               coffeeKcal        : "280",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "90",
                                               hasSugar          : true,
                                               hasFoam           : true,
                                               coffeeFoam        : "20",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false)
    
    let icedCaramelMacchiato        = MyCoffee(coffeeName        : "Iced Caramel Macchiato",
                                               coffeeKcal        : "270",
                                               coffeeCaffeine    : "150",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "75",
                                               hasSugar          : true,
                                               hasFoam           : true,
                                               coffeeFoam        : "15",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    let frappuccino                 = MyCoffee(coffeeName        : "Frappuccino",
                                               coffeeKcal        : "240",
                                               coffeeCaffeine    : "95",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "100",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "30",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : true)
    
    var coffeeMenuAll: [MyCoffee] = []
    var coffeeMenu = [""]
    
    var V3_size_parameter = 1.0
    
    @IBOutlet weak var optionPicker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coffeeMenuAll.removeAll(keepingCapacity: false)
        
        coffeeMenuAll.append(lungo) // new
        coffeeMenuAll.append(espresso)
        coffeeMenuAll.append(ristretto)
        coffeeMenuAll.append(blackEye) // new
        coffeeMenuAll.append(americano)
        coffeeMenuAll.append(turkishCoffee) // new
        coffeeMenuAll.append(espressoDoppio)
        // 7 no sugar & milk

        coffeeMenuAll.append(latte)
        coffeeMenuAll.append(misto)
        coffeeMenuAll.append(cortado)
        coffeeMenuAll.append(macchiato)
        coffeeMenuAll.append(cappucino)
        coffeeMenuAll.append(flatWhite)
        coffeeMenuAll.append(cafeCreme) // new
        // 7 no sugar
        
        coffeeMenuAll.append(mocha)
        coffeeMenuAll.append(conPanna) // new
        coffeeMenuAll.append(caramelMacchiato)
        coffeeMenuAll.append(whiteChocolateMocha)
        // 4 yes sugar
        
        coffeeMenuAll.append(affogato) // new
        coffeeMenuAll.append(icedLatte)
        coffeeMenuAll.append(icedMocha)
        coffeeMenuAll.append(frappuccino)
        coffeeMenuAll.append(icedAmericano)
        coffeeMenuAll.append(icedCaramelMacchiato)
        coffeeMenuAll.append(icedWhiteChocolateMocha)
        // 7 iced
        
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
        
        
        
        
        if V3_saved_selectedIndexes.contains(12)  { //size = venti
            V3_size_parameter = 24/16.0
            
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasSmallSize == false })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
            
        }
        
        if V3_saved_selectedIndexes.contains(11)  { //size = grande
            V3_size_parameter = 16/16.0
            
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasSmallSize == false })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
            
        }
        
        if V3_saved_selectedIndexes.contains(10)  { //size = tall
            V3_size_parameter = 12/16.0
            
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasSmallSize == false })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
            
        }
        
        UserDefaults.standard.set(V3_size_parameter, forKey: "UIPickerSizeParameter")

        
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
        UserDefaults.standard.set(V3_size_parameter, forKey: "UIPickerSizeParameter")
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
        UserDefaults.standard.set(V3_size_parameter, forKey: "UIPickerSizeParameter")
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
    
    
    @IBAction func BVC4(_ sender: UIButton) {dismiss(animated: true, completion: nil)}
    
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
    
    
    var V4_saved_selectedCoffeeName          = "No Match"
    var V4_saved_selectedCoffeeSize          = "-"
    var V4_saved_selectedCoffeeKcal          = "-"
    var V4_saved_selectedCoffeeCaffeine      = "-"
    var V4_saved_selectedCoffeeMilk          = "-"
    var V4_saved_selectedCoffeeFoam          = "-"
    var V4_saved_selectedCoffeeCream         = "-"
    var V4_saved_selectedSizeParameter       = 1.0
    
    
    let screenWidth  = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.BVC4.layer.cornerRadius =  screenWidth * 0.5 * 0.4
        
        V4_saved_selectedSizeParameter = Double(UserDefaults.standard.object(forKey:"UIPickerSizeParameter")    as? Float ?? Float())
        
        
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
        
        //print(V4_saved_selectedSizeParameter)
        
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
        else if  V4_saved_selectedCoffeeName=="Turkish Coffee"
            
         {
            labelCoffeeSize.text             = "Size: 75 ml (2.5 oz)"
         }
        else if  V4_saved_selectedCoffeeName=="Cortado" || V4_saved_selectedCoffeeName=="Lungo" || V4_saved_selectedCoffeeName=="Café Crème"
            
        {
            labelCoffeeSize.text             = "Size: 90 ml (3 oz)"
        }
        else if V4_saved_selectedCoffeeName=="Affogato" || V4_saved_selectedCoffeeName=="Con Panna"
            
         {
            labelCoffeeSize.text             = "Size: 150 ml (5 oz)"
         }
        else if V4_saved_selectedCoffeeName=="Black Eye"
            
        {
            labelCoffeeSize.text             = "Size: 180 ml (6 oz)"
        }
        else if  V4_saved_selectedCoffeeName=="No Match"
            
        {
            labelCoffeeSize.text             = "Size: -"
        }
        else
        {
            if V4_saved_selectedSizeParameter==1.5
            {
                labelCoffeeSize.text             = "Size: 720 ml (Venti)"
            }
            else if  V4_saved_selectedSizeParameter==0.75
            {
                labelCoffeeSize.text             = "Size: 360 ml (Tall)"
            }
            else
            {
                labelCoffeeSize.text             = "Size: 480 ml (Grande)"
            }
        }
        
        labelCoffeeKcal.font                 = UIFont(name: "Georgia", size: 26)!
        labelCoffeeKcal.textAlignment        = .center
        labelCoffeeCaffeine.font             = UIFont(name: "Georgia", size: 26)!
        labelCoffeeCaffeine.textAlignment    = .center
        labelCoffeeMilk.font                 = UIFont(name: "Georgia", size: 26)!
        labelCoffeeMilk.textAlignment        = .center
        labelCoffeeFoam.font                 = UIFont(name: "Georgia", size: 26)!
        labelCoffeeFoam.textAlignment        = .center
        labelCoffeeCream.font                = UIFont(name: "Georgia", size: 26)!
        labelCoffeeCream.textAlignment       = .center
        labelCoffeeCream.layer.cornerRadius  = 10
        labelCoffeeCream.layer.masksToBounds = true
        labelCoffeeCream.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        if  V4_saved_selectedCoffeeName != "No Match"
        {
            labelCoffeeKcal.text                 = "Calories: \(String(Int(Double(V4_saved_selectedCoffeeKcal)!*V4_saved_selectedSizeParameter))) Kcal"
            labelCoffeeCaffeine.text             = "Caffeine: \(String(Int(Double(V4_saved_selectedCoffeeCaffeine)!*V4_saved_selectedSizeParameter))) mg"
            if V4_saved_selectedCoffeeMilk=="-"
            {
            labelCoffeeMilk.text                 = "Steamed Milk: \(V4_saved_selectedCoffeeMilk)"
            }
            else
            {
            labelCoffeeMilk.text                 = "Steamed Milk: \(String(Int(Double(V4_saved_selectedCoffeeMilk)!*V4_saved_selectedSizeParameter))) ml"
            }
            if V4_saved_selectedCoffeeFoam=="-"
            {
                labelCoffeeFoam.text                 = "Foamed Milk: \(V4_saved_selectedCoffeeFoam)"
            }
            else
            {
                labelCoffeeFoam.text                 = "Foamed Milk: \(String(Int(Double(V4_saved_selectedCoffeeFoam)!*V4_saved_selectedSizeParameter))) ml"
            }
            if V4_saved_selectedCoffeeCream=="-"
            {
                labelCoffeeCream.text                = "Cream: \(V4_saved_selectedCoffeeCream)"
            }
            else
            {
                labelCoffeeCream.text                = "Cream: \(String(Int(Double(V4_saved_selectedCoffeeCream)!*V4_saved_selectedSizeParameter))) ml"
            }
        }
        else
        {
            labelCoffeeKcal.text                 = "Calories: \(V4_saved_selectedCoffeeKcal)"
            labelCoffeeCaffeine.text             = "Caffeine: \(V4_saved_selectedCoffeeCaffeine)"
            labelCoffeeMilk.text                 = "Steamed Milk: \(V4_saved_selectedCoffeeMilk)"
            labelCoffeeFoam.text                 = "Foamed Milk: \(V4_saved_selectedCoffeeFoam)"
            labelCoffeeCream.text                = "Cream: \(V4_saved_selectedCoffeeCream)"
        }
    }
}
