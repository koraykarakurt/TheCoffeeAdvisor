
//  ViewController.swift
//  The Coffee Advisor
//
//  Created by Koray Karakurt on 2.03.2019.
//  Copyright © 2019 Koray Karakurt. All rights reserved.
//

import UIKit
import UIMultiPicker


class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


class ViewController4: UIViewController {
    
    
    
    @IBOutlet weak var labelCoffeeName: UILabel!
    @IBOutlet weak var labelCoffeeKcal: UILabel!

    
    @IBOutlet weak var labelCoffeeCaffeine: UILabel!
    
    
    @IBOutlet weak var labelCoffeeMilk: UILabel!
    @IBOutlet weak var labelCoffeeFoam: UILabel!
    @IBOutlet weak var labelCoffeeCream: UILabel!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var V4_saved_selectedCoffeeName     = UserDefaults.standard.object(forKey:"UIPickerName")     as? String ?? String()
    var V4_saved_selectedCoffeeKcal     = UserDefaults.standard.object(forKey:"UIPickerKcal")     as? String ?? String()
    var V4_saved_selectedCoffeeCaffeine = UserDefaults.standard.object(forKey:"UIPickerCaffeine") as? String ?? String()
    var V4_saved_selectedCoffeeMilk     = UserDefaults.standard.object(forKey:"UIPickerMilk")     as? String ?? String()
    var V4_saved_selectedCoffeeFoam     = UserDefaults.standard.object(forKey:"UIPickerFoam")     as? String ?? String()
    var V4_saved_selectedCoffeeCream    = UserDefaults.standard.object(forKey:"UIPickerCream")    as? String ?? String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        labelCoffeeName.font = UIFont(name: "Georgia", size: 24)!
        labelCoffeeName.textAlignment = .center
        labelCoffeeName.text = "Name: \(V4_saved_selectedCoffeeName)"
        labelCoffeeName.layer.cornerRadius = 25
        labelCoffeeName.layer.masksToBounds = true
        labelCoffeeName.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        labelCoffeeKcal.font = UIFont(name: "Georgia", size: 24)!
        labelCoffeeKcal.textAlignment = .center
        labelCoffeeKcal.text = "Total Calorie: \(V4_saved_selectedCoffeeKcal)"
        
        labelCoffeeCaffeine.font = UIFont(name: "Georgia", size: 24)!
        labelCoffeeCaffeine.textAlignment = .center
        labelCoffeeCaffeine.text = "Caffeine: \(V4_saved_selectedCoffeeCaffeine)"
        
        labelCoffeeMilk.font = UIFont(name: "Georgia", size: 24)!
        labelCoffeeMilk.textAlignment = .center
        labelCoffeeMilk.text = "Steamed Milk: \(V4_saved_selectedCoffeeMilk)"
        
        labelCoffeeFoam.font = UIFont(name: "Georgia", size: 24)!
        labelCoffeeFoam.textAlignment = .center
        labelCoffeeFoam.text = "Foamed Milk: \(V4_saved_selectedCoffeeFoam)"
        
        labelCoffeeCream.font = UIFont(name: "Georgia", size: 24)!
        labelCoffeeCream.textAlignment = .center
        labelCoffeeCream.text = "Cream: \(V4_saved_selectedCoffeeCream)"
        
        labelCoffeeCream.layer.cornerRadius = 25
        labelCoffeeCream.layer.masksToBounds = true
        labelCoffeeCream.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        //         let screenSize: CGRect = UIScreen.main.bounds
        ////        let myView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width - 50, height: screenSize.width - 50))
        ////        self.view.addSubview(myView)
        //
        //        let myNewView=UIImageView(frame: CGRect(x: 50, y: 100, width: screenSize.width - 100, height: screenSize.height - 300))
        //
        //        myNewView.contentMode = UIView.ContentMode.scaleAspectFit
        //
        //        myNewView.backgroundColor=UIColor.lightText
        //
        //        let background = UIImage(named: "coffee_glass")
        //
        //        myNewView.image = background
        //
        //        myNewView.layer.cornerRadius=25
        //
        //        myNewView.layer.borderWidth=0
        //
        //        // Change UIView Border Color to Red
        //        myNewView.layer.borderColor = UIColor.red.cgColor
        //
        //        // Add UIView as a Subview
        //        self.view.addSubview(myNewView)
        
    }
    
    
}

class ViewController2: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    static let TASTES = [
        
        "Milk-free"             ,//0
        "Glucose-free"          ,//1
        //"No Caffeine"         ,
        //"Blonde Roast"        ,
        //"Medium Roast"        ,
        //"Dark Roast"          ,
        "Foam"                  ,//2
        "Cream"                 ,//3
        "Iced Coffee"           ,//4
        "> 1 Coffee Shot"       ,//5
        
        //"Cold Brew"           ,
        
        "Kcal < 50"             ,//6
        "Kcal < 100"            ,//7
        "Kcal < 200"            ,//8
        
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
        tastesPicker.addTarget(self, action: #selector(ViewController2.selected(_:)), for: .valueChanged)
        
        // Styling
        
        tastesPicker.color = .darkGray
        tastesPicker.tintColor = .black
        tastesPicker.font  = UIFont(name: "Georgia", size: 30)!
        tastesPicker.highlight(2, animated: true) // centering "Bitter"
    }
    
    @objc func selected(_ sender: UIMultiPicker) {
        UserDefaults.standard.set(sender.selectedIndexes, forKey: "UIMultiPickerIndexes")
        print(sender.selectedIndexes)
    }
}








class ViewController3: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var V3_saved_selectedIndexes = UserDefaults.standard.object(forKey:"UIMultiPickerIndexes") as? [Int] ?? [Int]()
    
    //let optionArray = ["Blonde Roast", "Medium Roast", "Dark Roast", "Milky", "Sugar-Free", "Kcal < 50", "Kcal < 100", "Kcal < 200"]
    
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
        var hasExtraShot        = false
        var hasIce              = false
        
        init(coffeeName: String, coffeeKcal: String, coffeeCaffeine: String, hasMilk: Bool, coffeeMilk: String, hasSugar: Bool, hasFoam: Bool, coffeeFoam: String, hasCream: Bool, coffeeCream: String, hasKcalLessThan50: Bool, hasKcalLessThan100: Bool, hasKcalLessThan200: Bool, hasExtraShot: Bool, hasIce: Bool) {
            
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
            self.hasExtraShot       = hasExtraShot
            self.hasIce             = hasIce
            
        }
    }
    
    let espresso                    = MyCoffee(coffeeName        : "Espresso",
                                               coffeeKcal        : "5 Kcal",
                                               coffeeCaffeine    : "75 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "N/I",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let espressoDoppio              = MyCoffee(coffeeName        : "Espresso Doppio",
                                               coffeeKcal        : "10 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "N/I",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let ristretto                   = MyCoffee(coffeeName        : "Ristretto",
                                               coffeeKcal        : "6 Kcal",
                                               coffeeCaffeine    : "90 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "N/I",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : true,
                                               hasIce            : false)
    
    let macchiato                   = MyCoffee(coffeeName        : "Macchiato",
                                               coffeeKcal        : "12 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "N/I",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "1 ml",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    //not sure cortado
    let cortado                     = MyCoffee(coffeeName        : "Cortado",
                                               coffeeKcal        : "72 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "N/I",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "30 ml",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    
    
    let latte                       = MyCoffee(coffeeName        : "Latte",
                                               coffeeKcal        : "230 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "300 ml",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "2 ml",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let icedLatte                   = MyCoffee(coffeeName        : "Iced Latte",
                                               coffeeKcal        : "150 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "180 ml",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "2 ml",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : true)
    
    let cappucino                   = MyCoffee(coffeeName        : "Cappucino",
                                               coffeeKcal        : "140 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "60 ml",
                                               hasSugar          : false,
                                               hasFoam           : true,
                                               coffeeFoam        : "60 ml",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    
    
    let americano                   = MyCoffee(coffeeName        : "Americano",
                                               coffeeKcal        : "15 Kcal",
                                               coffeeCaffeine    : "225 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "N/I",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let icedAmericano               = MyCoffee(coffeeName        : "Iced Americano",
                                               coffeeKcal        : "15 Kcal",
                                               coffeeCaffeine    : "225 mg",
                                               hasMilk           : false,
                                               coffeeMilk        : "N/I",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : true)
    
    let misto                       = MyCoffee(coffeeName        : "Misto",
                                               coffeeKcal        : "130 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "180 ml",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : true,
                                               hasKcalLessThan100: true,
                                               hasKcalLessThan200: true,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let flatWhite                   = MyCoffee(coffeeName        : "Flat White",
                                               coffeeKcal        : "220 Kcal",
                                               coffeeCaffeine    : "195 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "300 ml",
                                               hasSugar          : false,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let mocha                       = MyCoffee(coffeeName        : "Mocha",
                                               coffeeKcal        : "400 Kcal",
                                               coffeeCaffeine    : "175 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "30 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let icedMocha                   = MyCoffee(coffeeName        : "Iced Mocha",
                                               coffeeKcal        : "350 Kcal",
                                               coffeeCaffeine    : "175 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "25 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : true)
    
    let whiteChocolateMocha         = MyCoffee(coffeeName        : "White Chocolate Mocha",
                                               coffeeKcal        : "440 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "120 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : true,
                                               coffeeCream       : "60 ml",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let icedWhiteChocolateMocha     = MyCoffee(coffeeName        : "Iced White Chocolate Mocha",
                                               coffeeKcal        : "440 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "105 ml",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : true,
                                               coffeeCream       : "60 ml",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : true)
    
    let caramelMacchiato            = MyCoffee(coffeeName        : "Caramel Macchiato",
                                               coffeeKcal        : "280 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "90 ml",
                                               hasSugar          : true,
                                               hasFoam           : true,
                                               coffeeFoam        : "15 ml",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : false)
    
    let icedCaramelMacchiato        = MyCoffee(coffeeName        : "Iced Caramel Macchiato",
                                               coffeeKcal        : "280 Kcal",
                                               coffeeCaffeine    : "150 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "75 ml",
                                               hasSugar          : true,
                                               hasFoam           : true,
                                               coffeeFoam        : "N/I",
                                               hasCream          : false,
                                               coffeeCream       : "N/I",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : true)
    
    let frappuccino                 = MyCoffee(coffeeName        : "Frappuccino",
                                               coffeeKcal        : "240 Kcal",
                                               coffeeCaffeine    : "95 mg",
                                               hasMilk           : true,
                                               coffeeMilk        : "100 mk",
                                               hasSugar          : true,
                                               hasFoam           : false,
                                               coffeeFoam        : "N/I",
                                               hasCream          : true,
                                               coffeeCream       : "30 ml",
                                               hasKcalLessThan50 : false,
                                               hasKcalLessThan100: false,
                                               hasKcalLessThan200: false,
                                               hasExtraShot      : false,
                                               hasIce            : true)
    
    var coffeeMenuAll: [MyCoffee] = []
    
    var coffeeMenu = [""]
    
    //Pre-setup IBOutlets
    
    @IBOutlet weak var optionPicker: UIPickerView!
    
    //FUNCTIONS
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coffeeMenuAll.removeAll(keepingCapacity: false)
        
        coffeeMenuAll.append(espresso)
        coffeeMenuAll.append(ristretto)
        coffeeMenuAll.append(americano)
        
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
        
        if V3_saved_selectedIndexes.contains(5)  { //"> 1 Coffee Shot"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasExtraShot == true })
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
        
        if V3_saved_selectedIndexes.contains(8)  { //"Kcal < 200"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasKcalLessThan200 == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(7)  { //"Kcal < 100"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasKcalLessThan100 == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if V3_saved_selectedIndexes.contains(6)  { //"Kcal < 50"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasKcalLessThan50 == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }
        
        if coffeeMenu.count > 0 {
            coffeeMenu.remove(at: 0)
        }
        return coffeeMenu.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coffeeMenu[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        UserDefaults.standard.set(coffeeMenuAll[row].coffeeName     , forKey: "UIPickerName")
        UserDefaults.standard.set(coffeeMenuAll[row].coffeeKcal     , forKey: "UIPickerKcal")
        UserDefaults.standard.set(coffeeMenuAll[row].coffeeCaffeine , forKey: "UIPickerCaffeine")
        UserDefaults.standard.set(coffeeMenuAll[row].coffeeMilk     , forKey: "UIPickerMilk")
        UserDefaults.standard.set(coffeeMenuAll[row].coffeeFoam     , forKey: "UIPickerFoam")
        UserDefaults.standard.set(coffeeMenuAll[row].coffeeCream    , forKey: "UIPickerCream")
        
        let pickerLabel = UILabel()
        let titleData = coffeeMenu[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 28.0)!,NSAttributedString.Key.foregroundColor:UIColor.black])
        pickerLabel.attributedText = myTitle
        pickerLabel.backgroundColor = UIColor.init(red: 250.0/255.0, green: 235.0/255.0, blue: 215.0/255.0, alpha: 1)
        pickerLabel.textAlignment = .center
        return pickerLabel
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionPicker.delegate = self
        optionPicker.dataSource = self
    }
    
}


