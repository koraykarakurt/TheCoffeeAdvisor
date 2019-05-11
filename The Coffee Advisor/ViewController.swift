//
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


class ViewController2: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    static let TASTES = [

        "Milk-free"             ,//no milk
        "Glucose-free"          ,//no sugar
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
        var hasMilk             = false
        var hasSugar            = false
        var hasFoam             = false
        var hasCream            = false
        var hasKcalLessThan50   = false
        var hasKcalLessThan100  = false
        var hasKcalLessThan200  = false
        var hasExtraShot        = false
        var hasIce              = false
    
        init(coffeeName: String, coffeeKcal: String, hasMilk: Bool, hasSugar: Bool, hasFoam: Bool, hasCream: Bool, hasKcalLessThan50: Bool, hasKcalLessThan100: Bool, hasKcalLessThan200: Bool, hasExtraShot: Bool, hasIce: Bool) {
        
            self.coffeeName         = coffeeName
            self.coffeeKcal         = coffeeKcal
            self.hasMilk            = hasMilk
            self.hasSugar           = hasSugar
            self.hasFoam            = hasFoam
            self.hasCream           = hasCream
            self.hasKcalLessThan50  = hasKcalLessThan50
            self.hasKcalLessThan100 = hasKcalLessThan100
            self.hasKcalLessThan200 = hasKcalLessThan200
            self.hasExtraShot       = hasExtraShot
            self.hasIce             = hasIce
            
        }
    }

    let espresso = MyCoffee(coffeeName: "Espresso", coffeeKcal: "7 Kcal", hasMilk: false, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: false)
    
    let ristretto = MyCoffee(coffeeName: "Ristretto", coffeeKcal: "9 Kcal", hasMilk: false, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: true, hasIce: false)
    
    let macchiato = MyCoffee(coffeeName: "Macchiato", coffeeKcal: "127 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let latte = MyCoffee(coffeeName: "Latte", coffeeKcal: "224 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let icedLatte = MyCoffee(coffeeName: "Iced Latte", coffeeKcal: "221 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: true)
    
    let cappucino = MyCoffee(coffeeName: "Cappucino", coffeeKcal: "203 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let americano = MyCoffee(coffeeName: "Americano", coffeeKcal: "7 Kcal", hasMilk: false, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: false)
    
    let icedAmericano = MyCoffee(coffeeName: "Iced Americano", coffeeKcal: "7 Kcal", hasMilk: false, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: true)
    
    let misto = MyCoffee(coffeeName: "Misto", coffeeKcal: "77 Kcal", hasMilk: true, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: false)
    
    let flatWhite = MyCoffee(coffeeName: "Flat White", coffeeKcal: "217 Kcal", hasMilk: true, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let mocha = MyCoffee(coffeeName: "Mocha", coffeeKcal: "227 Kcal", hasMilk: true, hasSugar: true, hasFoam: false, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)

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
        coffeeMenuAll.append(macchiato)
        coffeeMenuAll.append(americano)
        coffeeMenuAll.append(latte)
        coffeeMenuAll.append(misto)
        coffeeMenuAll.append(mocha)
        coffeeMenuAll.append(cappucino)
        coffeeMenuAll.append(flatWhite)
        coffeeMenuAll.append(icedLatte)
        coffeeMenuAll.append(icedAmericano)

        coffeeMenu = [""]
        
        for i in 0 ..< coffeeMenuAll.count {
            coffeeMenu.append(coffeeMenuAll[i].coffeeName)
        }
    
        if V3_saved_selectedIndexes.contains(0)  { //"Milk-free"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasMilk == false }).map({ return $0.coffeeName })
        }
        
        if V3_saved_selectedIndexes.contains(1)  { //"Glucose-free"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasSugar == false }).map({ return $0.coffeeName })
        }

        if V3_saved_selectedIndexes.contains(2)  { //"Foam"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasFoam == true }).map({ return $0.coffeeName })
        }

        if V3_saved_selectedIndexes.contains(3)  { //"Cream"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasCream == true }).map({ return $0.coffeeName })
        }

        if V3_saved_selectedIndexes.contains(4)  { //"Extra Shot"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasExtraShot == true }).map({ return $0.coffeeName })

        }

        if V3_saved_selectedIndexes.contains(5)  { //"Iced Coffee"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasIce == true }).map({ return $0.coffeeName })
        }

        if V3_saved_selectedIndexes.contains(6)  { //"Kcal < 50"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasKcalLessThan50 == true }).map({ return $0.coffeeName })
        }
        
        if V3_saved_selectedIndexes.contains(7)  { //"Kcal < 100"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasKcalLessThan100 == true }).map({ return $0.coffeeName })
        }

        if V3_saved_selectedIndexes.contains(8)  { //"Kcal < 200"
            coffeeMenu = coffeeMenuAll.filter( {$0.hasKcalLessThan200 == true }).map({ return $0.coffeeName })
        }
        
        if coffeeMenu.count > 1 {
        coffeeMenu.remove(at: 0)
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
        pickerLabel.backgroundColor = UIColor.init(red: 250.0/255.0, green: 235.0/255.0, blue: 215.0/255.0, alpha: 1)
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

//"Ristretto Bianco"           ,        //"Lungo"

//tastesPicker.font = UIFont(descriptor: normalFont.fontDescriptor.withSymbolicTraits(.traitBold)!, size: normalFont.pointSize)

//tastesPicker.font = .systemFont(ofSize: 30, weight: .semibold)

//tastesPicker.selectedIndexes = [saved_selectedIndexes]

//    coffeeMenu =
//        [
//        "Espresso"                     ,
//        "Ristretto"                    ,
//        "Americano"                    ,
//
//        "Latte"                        ,//milk
//        "Misto"                        ,//milk
//        "Cortado"                      ,//milk
//        "Cappucino"                    ,//milk
//        "Macchiato"                    ,//milk
//        "Flat White"                   ,//milk
//
//        "Mocha"                        ,//milk+sugar
//        "Frappuccino"                  ,//milk+sugar
//        "Caramel Macchiato"            ,//milk+sugar
//        "White Chocolate Mocha"        ,//milk+sugar
//
//        "Iced Latte"                   ,//milk
//        "Iced Mocha"                   ,//milk+sugar
//        "Iced Americano"               ,
//        "Iced Caramel Macchiato"       ,//milk+sugar
//        "Iced White Chocolate Mocha"    //milk+sugar
//        ]

//            coffeeMenu.append("Lungo")
//            coffeeMenu.append("Espresso")
//            coffeeMenu.append("Macchiato")
//            coffeeMenu.append("Ristretto")
//            coffeeMenu.append("Americano")
//
//            coffeeMenu.append("Latte")
//            coffeeMenu.append("Misto")
//            coffeeMenu.append("Cappucino")
//            coffeeMenu.append("Flat White")
//            coffeeMenu.append("Cortado")
//
//            coffeeMenu.append("Iced Americano")
//            coffeeMenu.append("Iced Latte")
