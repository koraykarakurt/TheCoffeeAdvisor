
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
    @IBAction func MCA(_ sender: UIButton) {
        dismissDetailRight()
    }
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
        "Alcohol"                   ,//4
        "Iced Coffee"               ,//5
        "Espresso Shots > 1"        ,//6
        "Espresso Shots > 2"        ,//7
        "Calories < 50 Kcal"        ,//8
        "Calories < 100 Kcal"       ,//9
        "Calories < 200 Kcal"       ,//10
        "360 ml (Tall)"             ,//11
        "480 ml (Grande)"           ,//12
        "720 ml (Venti)"             //13
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
        let saved_lastSelectedMultiPickerRow = defaults.object(forKey:"lastSelectedMultiPickerRow") as? Int ?? Int ()
        //print(saved_lastSelectedMultiPickerRow)
        self.tastesPicker.layer.cornerRadius =  screenWidth * 0.5 * 0.8
        self.BVC2.layer.cornerRadius = screenWidth * 0.5 * 0.4
        tastesPicker.options = ViewController2.TASTES
        tastesPicker.selectedIndexes = saved_selectedIndexes
        tastesPicker.addTarget(self, action: #selector(ViewController2.selected(_:)), for: .valueChanged)
        tastesPicker.color = .darkGray
        tastesPicker.tintColor = .black
        tastesPicker.font  = UIFont(name: "Georgia", size: 28)!
        tastesPicker.highlight(saved_lastSelectedMultiPickerRow, animated: true)
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
    @IBAction func BVC3(_ sender: UIButton) {
        dismissDetailLeft()
    }
    @IBOutlet weak var DVC3: UIButton!
    var V3_saved_selectedIndexes = UserDefaults.standard.object(forKey:"UIMultiPickerIndexes") as? [Int] ?? [Int]()
    class MyCoffee {
        var coffeeName          = ""
        var coffeeKcal          = ""
        var coffeeCaffeineS     = ""
        var coffeeCaffeineM     = ""
        var coffeeCaffeineL     = ""
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
        var hasAlcohol          = false
        init(coffeeName: String, coffeeKcal: String, coffeeCaffeineS: String, coffeeCaffeineM: String, coffeeCaffeineL: String, hasMilk: Bool, hasSmallSize: Bool, coffeeMilk: String, hasSugar: Bool, hasFoam: Bool, coffeeFoam: String, hasCream: Bool, coffeeCream: String, hasKcalLessThan50: Bool, hasKcalLessThan100: Bool, hasKcalLessThan200: Bool, hasMoreThan1shot: Bool, hasMoreThan2shot: Bool, hasIce: Bool, hasAlcohol: Bool) {
            self.coffeeName         = coffeeName
            self.coffeeKcal         = coffeeKcal
            self.coffeeCaffeineS    = coffeeCaffeineS
            self.coffeeCaffeineM    = coffeeCaffeineM
            self.coffeeCaffeineL    = coffeeCaffeineL
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
            self.hasAlcohol         = hasAlcohol

        }
    }
    var espresso                    = MyCoffee(coffeeName        : "Espresso",
                                               coffeeKcal        : "5",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "75",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var romano                      = MyCoffee(coffeeName        : "Romano",
                                               coffeeKcal        : "7",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "75",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var turkishCoffee               = MyCoffee(coffeeName   : "Turkish Coffee",
                                               coffeeKcal        : "4",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "60",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var espressoDoppio              = MyCoffee(coffeeName        : "Espresso Doppio",
                                               coffeeKcal        : "10",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var ristretto                   = MyCoffee(coffeeName        : "Ristretto",
                                               coffeeKcal        : "7",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "110",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var lungo                       = MyCoffee(coffeeName        : "Lungo",
                                               coffeeKcal        : "10",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var redEye                      = MyCoffee(coffeeName        : "Red Eye",
                                               coffeeKcal        : "9",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "155",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var blackEye                    = MyCoffee(coffeeName     : "Black Eye",
                                               coffeeKcal        : "14",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "230",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var macchiato                   = MyCoffee(coffeeName        : "Macchiato",
                                               coffeeKcal        : "12",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var cortado                     = MyCoffee(coffeeName        : "Cortado",
                                               coffeeKcal        : "30",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "-",
                                               hasMilk           : true,
                                               hasSmallSize      : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "30",// 15 Kcal
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var cafeCreme                       = MyCoffee(coffeeName    : "Café Crème",
                                               coffeeKcal        : "114",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "-",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "30",//heavy cream 104  Kcal
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var latte                       = MyCoffee(coffeeName        : "Latte",
                                               coffeeKcal        : "218",
                                               coffeeCaffeineS   : "75",
                                               coffeeCaffeineM   : "150",//60 ml = 10 Kcal
                                               coffeeCaffeineL   : "150",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "360",//200 Kcal
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var icedLatte                   = MyCoffee(coffeeName        : "Iced Latte",
                                               coffeeKcal        : "148",
                                               coffeeCaffeineS   : "75",
                                               coffeeCaffeineM   : "150",//60 ml = 10 Kcal
                                               coffeeCaffeineL   : "150",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "240",//130 Kcal
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
                                               hasIce            : true,
                                               hasAlcohol        : false)
    var cappuccino                   = MyCoffee(coffeeName       : "Cappuccino",
                                               coffeeKcal        : "155",
                                               coffeeCaffeineS   : "75",
                                               coffeeCaffeineM   : "150",//60 ml = 10 Kcal
                                               coffeeCaffeineL   : "150",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "180",//100 Kcal
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var americano                   = MyCoffee(coffeeName        : "Americano",
                                               coffeeKcal        : "15",
                                               coffeeCaffeineS   : "150",
                                               coffeeCaffeineM   : "225",
                                               coffeeCaffeineL   : "300",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var icedAmericano               = MyCoffee(coffeeName        : "Iced Americano",
                                               coffeeKcal        : "15",
                                               coffeeCaffeineS   : "150",
                                               coffeeCaffeineM   : "225",
                                               coffeeCaffeineL   : "300",
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
                                               hasIce            : true,
                                               hasAlcohol        : false)
    var misto                       = MyCoffee(coffeeName        : "Misto",
                                               coffeeKcal        : "132",
                                               coffeeCaffeineS   : "110",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "195",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "220",//122 Kcal
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : false,
                                               coffeeCream       : "-",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : true,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var flatWhite                   = MyCoffee(coffeeName        : "Flat White",
                                               coffeeKcal        : "212",
                                               coffeeCaffeineS   : "95",
                                               coffeeCaffeineM   : "190",
                                               coffeeCaffeineL   : "190",
                                               hasMilk           : true,
                                               hasSmallSize      : false,
                                               coffeeMilk        : "360",//200 Kcal
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var conPanna                   = MyCoffee(coffeeName        : "Con Panna",
                                              coffeeKcal        : "323",
                                              coffeeCaffeineS   : "-",
                                              coffeeCaffeineM   : "150",
                                              coffeeCaffeineL   : "-",
                                              hasMilk           : false,
                                              hasSmallSize      : true,
                                              coffeeMilk        : "-",
                                              hasSugar          : true,
                                              hasFoam           : false,
                                              coffeeFoam        : "-",
                                              hasCream          : true,
                                              coffeeCream       : "90",
                                              hasKcalLessThan50 : false,
                                              hasKcalLessThan100: false,
                                              hasKcalLessThan200: false,
                                              hasMoreThan1shot  : true,
                                              hasMoreThan2shot  : false,
                                              hasIce            : false,
                                              hasAlcohol        : false)
    var corretto                    = MyCoffee(coffeeName        : "Corretto",
                                               coffeeKcal        : "41",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "75",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : false,
                                               hasAlcohol        : true)
    var freddo                      = MyCoffee(coffeeName        : "Freddo",
                                               coffeeKcal        : "40",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "75",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : true,
                                               hasAlcohol        : true)
    var irishCoffee                  = MyCoffee(coffeeName       : "Irish Coffee",
                                               coffeeKcal        : "191",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "75",
                                               coffeeCaffeineL   : "-",
                                               hasMilk           : false,
                                               hasSmallSize      : true,
                                               coffeeMilk        : "-",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "-",
                                               hasCream          : true,
                                               coffeeCream       : "30",//fresh cream 100 kcal
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasMoreThan1shot  : false,
                                               hasMoreThan2shot  : false,
                                               hasIce            : false,
                                               hasAlcohol        : true)
    var mocha                       = MyCoffee(coffeeName        : "Mocha",
                                               coffeeKcal        : "400",
                                               coffeeCaffeineS   : "95",
                                               coffeeCaffeineM   : "175",
                                               coffeeCaffeineL   : "175",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var affogato                       = MyCoffee(coffeeName     : "Affogato",
                                               coffeeKcal        : "196",
                                               coffeeCaffeineS   : "-",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "-",
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
                                               hasIce            : true,
                                               hasAlcohol        : false)
    var icedMocha                   = MyCoffee(coffeeName        : "Iced Mocha",
                                               coffeeKcal        : "350",
                                               coffeeCaffeineS   : "95",
                                               coffeeCaffeineM   : "175",
                                               coffeeCaffeineL   : "175",
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
                                               hasIce            : true,
                                               hasAlcohol        : false)
    var whiteChocolateMocha         = MyCoffee(coffeeName        : "White Chocolate Mocha",
                                               coffeeKcal        : "440",
                                               coffeeCaffeineS   : "95",
                                               coffeeCaffeineM   : "175",
                                               coffeeCaffeineL   : "175",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var icedWhiteChocolateMocha     = MyCoffee(coffeeName        : "Iced White Chocolate Mocha",
                                               coffeeKcal        : "420",
                                               coffeeCaffeineS   : "95",
                                               coffeeCaffeineM   : "175",
                                               coffeeCaffeineL   : "175",
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
                                               hasIce            : true,
                                               hasAlcohol        : false)
    var caramelMacchiato            = MyCoffee(coffeeName        : "Caramel Macchiato",
                                               coffeeKcal        : "280",
                                               coffeeCaffeineS   : "75",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "150",
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
                                               hasIce            : false,
                                               hasAlcohol        : false)
    var icedCaramelMacchiato        = MyCoffee(coffeeName        : "Iced Caramel Macchiato",
                                               coffeeKcal        : "270",
                                               coffeeCaffeineS   : "75",
                                               coffeeCaffeineM   : "150",
                                               coffeeCaffeineL   : "150",
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
                                               hasIce            : true,
                                               hasAlcohol        : false)
    var frappuccino                 = MyCoffee(coffeeName        : "Frappuccino",
                                               coffeeKcal        : "240",
                                               coffeeCaffeineS   : "70",
                                               coffeeCaffeineM   : "95",
                                               coffeeCaffeineL   : "120",
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
                                               hasIce            : true,
                                               hasAlcohol        : false)
    var coffeeMenuAll: [MyCoffee] = []
    var coffeeMenu = [""]
    var V3_size_parameter = 1.0
    @IBOutlet weak var optionPicker: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        coffeeMenuAll.removeAll(keepingCapacity: false)
        coffeeMenuAll.append(lungo)
        coffeeMenuAll.append(redEye)//new
        coffeeMenuAll.append(romano)//new
        coffeeMenuAll.append(espresso)
        coffeeMenuAll.append(ristretto)
        coffeeMenuAll.append(blackEye)
        coffeeMenuAll.append(americano)
        coffeeMenuAll.append(turkishCoffee)
        coffeeMenuAll.append(espressoDoppio)
        // 9 no sugar & milk (shows up)
        coffeeMenuAll.append(latte)
        coffeeMenuAll.append(misto)
        coffeeMenuAll.append(cortado)
        coffeeMenuAll.append(macchiato)
        coffeeMenuAll.append(flatWhite)
        coffeeMenuAll.append(cafeCreme)
        coffeeMenuAll.append(cappuccino)
        // 7 no sugar
        coffeeMenuAll.append(corretto)//new
        coffeeMenuAll.append(irishCoffee)//new
        // 2 yes alcohol
        coffeeMenuAll.append(mocha)
        coffeeMenuAll.append(conPanna)
        coffeeMenuAll.append(caramelMacchiato)
        coffeeMenuAll.append(whiteChocolateMocha)
        // 4 yes sugar
        coffeeMenuAll.append(freddo)//new
        coffeeMenuAll.append(affogato)
        coffeeMenuAll.append(icedLatte)
        coffeeMenuAll.append(icedMocha)
        coffeeMenuAll.append(frappuccino)
        coffeeMenuAll.append(icedAmericano)
        coffeeMenuAll.append(icedCaramelMacchiato)
        coffeeMenuAll.append(icedWhiteChocolateMocha)
        // 8 iced
        coffeeMenu = [""]
        for i in 0 ..< coffeeMenuAll.count {
            coffeeMenu.append(coffeeMenuAll[i].coffeeName)
        }
        if V3_saved_selectedIndexes.contains(13) { //size = venti
            V3_size_parameter = 24/16.0
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasSmallSize == false })
            for i in 0 ..< coffeeMenuAll.count {
                if Int(V3_size_parameter*(Double(coffeeMenuAll[i].coffeeKcal))!) > 200 {
                coffeeMenuAll[i].hasKcalLessThan200 = false
                }
                if Int(V3_size_parameter*(Double(coffeeMenuAll[i].coffeeKcal))!) > 100 {
                    coffeeMenuAll[i].hasKcalLessThan100 = false
                }
                if Int(V3_size_parameter*(Double(coffeeMenuAll[i].coffeeKcal))!) > 50 {
                    coffeeMenuAll[i].hasKcalLessThan50 = false
                }
            }
            for i in 0 ..< coffeeMenuAll.count {
                if Int(coffeeMenuAll[i].coffeeCaffeineL)! > 150 {
                    coffeeMenuAll[i].hasMoreThan2shot = true
                    coffeeMenuAll[i].hasMoreThan1shot = true
                }
                else if Int(coffeeMenuAll[i].coffeeCaffeineL)! > 75 {
                    coffeeMenuAll[i].hasMoreThan2shot = false
                    coffeeMenuAll[i].hasMoreThan1shot = true
                }
                else {
                    coffeeMenuAll[i].hasMoreThan2shot = false
                    coffeeMenuAll[i].hasMoreThan1shot = false
                }
            }
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(12) {
            //size = grande
            V3_size_parameter = 16/16.0
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasSmallSize == false})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count
            {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(11) {
            //size = tall
            V3_size_parameter = 12/16.0
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasSmallSize == false})
            for i in 0 ..< coffeeMenuAll.count {
                if Int(V3_size_parameter*(Double(coffeeMenuAll[i].coffeeKcal))!) < 200 {
                    coffeeMenuAll[i].hasKcalLessThan200 = true
                }
                if Int(V3_size_parameter*(Double(coffeeMenuAll[i].coffeeKcal))!) < 100 {
                    coffeeMenuAll[i].hasKcalLessThan100 = true
                }
                if Int(V3_size_parameter*(Double(coffeeMenuAll[i].coffeeKcal))!) < 50 {
                    coffeeMenuAll[i].hasKcalLessThan50 = true
                }
            }
            for i in 0 ..< coffeeMenuAll.count {
                if Int(coffeeMenuAll[i].coffeeCaffeineS)! <= 75 {
                    coffeeMenuAll[i].hasMoreThan2shot = false
                    coffeeMenuAll[i].hasMoreThan1shot = false
                }
                else if Int(coffeeMenuAll[i].coffeeCaffeineS)! <= 150 {
                    coffeeMenuAll[i].hasMoreThan2shot = false
                    coffeeMenuAll[i].hasMoreThan1shot = true
                }
                else {
                    coffeeMenuAll[i].hasMoreThan2shot = true
                    coffeeMenuAll[i].hasMoreThan1shot = true
                }
            }
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        UserDefaults.standard.set(V3_size_parameter, forKey: "UIPickerSizeParameter")
        if V3_saved_selectedIndexes.contains(0) {
            //"Milk-free"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasMilk == false})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(1) {
            //"Glucose-free"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasSugar == false })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(2) {
            //"Foam"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasFoam == true})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(3) {
            //"Cream"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasCream == true})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(4) {
            //"Alcohol"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasAlcohol == true})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(5) {
            //"Iced Coffee"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasIce == true})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(6) {
            //"Espresso Shot > 1"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasMoreThan1shot == true})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(7) {
            //"Espresso Shot > 2"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasMoreThan2shot == true})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(10) {
            //"Kcal < 200"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasKcalLessThan200 == true})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(9) {
            //"Kcal < 100"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasKcalLessThan100 == true})
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if V3_saved_selectedIndexes.contains(8) {
            //"Kcal < 50"
            coffeeMenuAll = coffeeMenuAll.filter({$0.hasKcalLessThan50 == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        if coffeeMenu.count > 0 {
            coffeeMenu.remove(at: 0)
        }
        if coffeeMenuAll.count>0 {
            UserDefaults.standard.set(coffeeMenuAll.count, forKey: "UIPickerElements")
        }
        else {
            UserDefaults.standard.set(0, forKey: "UIPickerElements")
        }
        return coffeeMenu.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print(row)
        UserDefaults.standard.set(V3_size_parameter, forKey: "UIPickerSizeParameter")
        if row >= 0 && coffeeMenuAll.count>0 {
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeName     , forKey: "UIPickerName")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeKcal     , forKey: "UIPickerKcal")
            if coffeeMenuAll[row].hasSmallSize == true {
                UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeineM , forKey: "UIPickerCaffeine")
            }
            else {
                if V3_size_parameter > 1.0 {
                    UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeineL , forKey: "UIPickerCaffeine")
                }
                else if  V3_size_parameter < 1.0 {
                    UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeineS , forKey: "UIPickerCaffeine")
                }
                else {
                    UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeineM , forKey: "UIPickerCaffeine")
                }
            }
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeMilk     , forKey: "UIPickerMilk")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeFoam     , forKey: "UIPickerFoam")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeCream    , forKey: "UIPickerCream")
        }
        else {
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
        if row >= 0 && coffeeMenuAll.count>0 {
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeName     , forKey: "UIPickerName")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeKcal     , forKey: "UIPickerKcal")
            if coffeeMenuAll[row].hasSmallSize == true {
                UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeineM , forKey: "UIPickerCaffeine")
            }
            else {
                if V3_size_parameter > 1.0 {
                    UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeineL , forKey: "UIPickerCaffeine")
                }
                else if  V3_size_parameter < 1.0 {
                    UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeineS , forKey: "UIPickerCaffeine")
                }
                else {
                    UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeineM , forKey: "UIPickerCaffeine")
                }
            }
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeMilk , forKey: "UIPickerMilk")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeFoam , forKey: "UIPickerFoam")
            UserDefaults.standard.set(coffeeMenuAll[row].coffeeCream, forKey: "UIPickerCream")
        }
        else {
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
    @IBAction func BVC4(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
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
        if UserDefaults.standard.object(forKey:"UIPickerElements") as? Int ?? Int() > 0 {
            V4_saved_selectedCoffeeName          = UserDefaults.standard.object(forKey:"UIPickerName")      as? String ?? String()
            V4_saved_selectedCoffeeSize          = UserDefaults.standard.object(forKey:"UIPickerSizes")     as? String ?? String()
            V4_saved_selectedCoffeeKcal          = UserDefaults.standard.object(forKey:"UIPickerKcal")      as? String ?? String()
            V4_saved_selectedCoffeeCaffeine      = UserDefaults.standard.object(forKey:"UIPickerCaffeine")  as? String ?? String()
            V4_saved_selectedCoffeeMilk          = UserDefaults.standard.object(forKey:"UIPickerMilk")      as? String ?? String()
            V4_saved_selectedCoffeeFoam          = UserDefaults.standard.object(forKey:"UIPickerFoam")      as? String ?? String()
            V4_saved_selectedCoffeeCream         = UserDefaults.standard.object(forKey:"UIPickerCream")     as? String ?? String()
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
         if V4_saved_selectedCoffeeName=="Espresso" || V4_saved_selectedCoffeeName=="Romano" {
            labelCoffeeSize.text             = "Size: 30 ml (1 oz)"
        }
        else if V4_saved_selectedCoffeeName=="Ristretto" {
            labelCoffeeSize.text             = "Size: 22.5 ml (.75 oz)"
        }
        else if V4_saved_selectedCoffeeName=="Corretto" {
            labelCoffeeSize.text             = "Size: 45 ml (1.5 oz)"
        }
        else if  V4_saved_selectedCoffeeName=="Macchiato" || V4_saved_selectedCoffeeName=="Espresso Doppio"{
            labelCoffeeSize.text             = "Size: 60 ml (2 oz)"
        }
        else if  V4_saved_selectedCoffeeName=="Turkish Coffee" {
            labelCoffeeSize.text             = "Size: 75 ml (2.5 oz)"
        }
        else if  V4_saved_selectedCoffeeName=="Cortado" || V4_saved_selectedCoffeeName=="Lungo" || V4_saved_selectedCoffeeName=="Café Crème" || V4_saved_selectedCoffeeName=="Freddo"{
            labelCoffeeSize.text             = "Size: 90 ml (3 oz)"
        }
        else if V4_saved_selectedCoffeeName=="Affogato" || V4_saved_selectedCoffeeName=="Con Panna" || V4_saved_selectedCoffeeName=="Irish Coffee" || V4_saved_selectedCoffeeName=="Red Eye" {
            labelCoffeeSize.text             = "Size: 150 ml (5 oz)"
        }
        else if V4_saved_selectedCoffeeName=="Black Eye" {
            labelCoffeeSize.text             = "Size: 180 ml (6 oz)"
        }
        else if  V4_saved_selectedCoffeeName=="No Match" {
            labelCoffeeSize.text             = "Size: -"
        }
        else {
            if V4_saved_selectedSizeParameter==1.5 {
                labelCoffeeSize.text             = "Size: 720 ml (Venti)"
            }
            else if  V4_saved_selectedSizeParameter==0.75 {
                labelCoffeeSize.text             = "Size: 360 ml (Tall)"
            }
            else {
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
        if  V4_saved_selectedCoffeeName != "No Match" {
            labelCoffeeKcal.text                 = "Calories: \(String(Int(Double(V4_saved_selectedCoffeeKcal)!*V4_saved_selectedSizeParameter))) Kcal"
            labelCoffeeCaffeine.text             = "Caffeine: \(V4_saved_selectedCoffeeCaffeine) mg"
            //labelCoffeeCaffeine.text             = "Caffeine: \(String(Int(Double(V4_saved_selectedCoffeeCaffeine)!*V4_saved_selectedSizeParameter))) mg"
            if V4_saved_selectedCoffeeMilk=="-" {
            labelCoffeeMilk.text                 = "Steamed Milk: \(V4_saved_selectedCoffeeMilk)"
            }
            else {
            labelCoffeeMilk.text                 = "Steamed Milk: \(String(Int(Double(V4_saved_selectedCoffeeMilk)!*V4_saved_selectedSizeParameter))) ml"
            }
            if V4_saved_selectedCoffeeFoam=="-" {
                labelCoffeeFoam.text                 = "Foamed Milk: \(V4_saved_selectedCoffeeFoam)"
            }
            else {
                labelCoffeeFoam.text                 = "Foamed Milk: \(String(Int(Double(V4_saved_selectedCoffeeFoam)!*V4_saved_selectedSizeParameter))) ml"
            }
            if V4_saved_selectedCoffeeCream=="-" {
                labelCoffeeCream.text                = "Cream: \(V4_saved_selectedCoffeeCream)"
            }
            else {
                labelCoffeeCream.text                = "Cream: \(String(Int(Double(V4_saved_selectedCoffeeCream)!*V4_saved_selectedSizeParameter))) ml"
            }
        }
        else {
            labelCoffeeKcal.text                 = "Calories: \(V4_saved_selectedCoffeeKcal)"
            labelCoffeeCaffeine.text             = "Caffeine: \(V4_saved_selectedCoffeeCaffeine)"
            labelCoffeeMilk.text                 = "Steamed Milk: \(V4_saved_selectedCoffeeMilk)"
            labelCoffeeFoam.text                 = "Foamed Milk: \(V4_saved_selectedCoffeeFoam)"
            labelCoffeeCream.text                = "Cream: \(V4_saved_selectedCoffeeCream)"
        }
    }
}
