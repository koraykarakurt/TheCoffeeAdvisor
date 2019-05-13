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
    
    let macchiato = MyCoffee(coffeeName: "Macchiato", coffeeKcal: "49 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: false)
    
    let latte = MyCoffee(coffeeName: "Latte", coffeeKcal: "224 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let icedLatte = MyCoffee(coffeeName: "Iced Latte", coffeeKcal: "221 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: true)
    
    let cappucino = MyCoffee(coffeeName: "Cappucino", coffeeKcal: "211 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let cortado = MyCoffee(coffeeName: "Cortado", coffeeKcal: "72 Kcal", hasMilk: true, hasSugar: false, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: false)
    
    let americano = MyCoffee(coffeeName: "Americano", coffeeKcal: "7 Kcal", hasMilk: false, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: false)
    
    let icedAmericano = MyCoffee(coffeeName: "Iced Americano", coffeeKcal: "6 Kcal", hasMilk: false, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: true)
    
    let misto = MyCoffee(coffeeName: "Misto", coffeeKcal: "47 Kcal", hasMilk: true, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: true , hasKcalLessThan100: true , hasKcalLessThan200: true, hasExtraShot: false, hasIce: false)
    
    let flatWhite = MyCoffee(coffeeName: "Flat White", coffeeKcal: "205 Kcal", hasMilk: true, hasSugar: false, hasFoam: false, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let mocha = MyCoffee(coffeeName: "Mocha", coffeeKcal: "287 Kcal", hasMilk: true, hasSugar: true, hasFoam: false, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let icedMocha = MyCoffee(coffeeName: "Iced Mocha", coffeeKcal: "275 Kcal", hasMilk: true, hasSugar: true, hasFoam: false, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: true)
    
    let whiteChocolateMocha = MyCoffee(coffeeName: "White Chocolate Mocha", coffeeKcal: "430 Kcal", hasMilk: true, hasSugar: true, hasFoam: false, hasCream: true, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let icedWhiteChocolateMocha = MyCoffee(coffeeName: "Iced White Chocolate Mocha", coffeeKcal: "427 Kcal", hasMilk: true, hasSugar: true, hasFoam: false, hasCream: true, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: true)
   
    let caramelMacchiato = MyCoffee(coffeeName: "Caramel Macchiato", coffeeKcal: "338 Kcal", hasMilk: true, hasSugar: true, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: false)
    
    let icedCaramelMacchiato = MyCoffee(coffeeName: "Iced Caramel Macchiato", coffeeKcal: "333 Kcal", hasMilk: true, hasSugar: true, hasFoam: true, hasCream: false, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: true)
    
    let frappuccino = MyCoffee(coffeeName: "Frappuccino", coffeeKcal: "420 Kcal", hasMilk: true, hasSugar: true, hasFoam: false, hasCream: true, hasKcalLessThan50: false , hasKcalLessThan100: false , hasKcalLessThan200: false, hasExtraShot: false, hasIce: true)

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

        if V3_saved_selectedIndexes.contains(4)  { //"Extra Shot"
            coffeeMenuAll = coffeeMenuAll.filter( {$0.hasExtraShot == true })
            coffeeMenu = [""]
            for i in 0 ..< coffeeMenuAll.count {
                coffeeMenu.append(coffeeMenuAll[i].coffeeName)
            }
        }

        if V3_saved_selectedIndexes.contains(5)  { //"Iced Coffee"
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

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(mymm.coffeeMenuNames)
        //print(mymm.coffeeMenuKcals)
        optionPicker.delegate = self
        optionPicker.dataSource = self
        //optionPicker.selectRow((coffeeMenu.count)/2, inComponent: 0, animated: false)
        
    }
    
}

//            "Espresso"
//            "Ristretto"
//            "Americano"

//            "Macchiato"
//            "Cortado"
//            "Latte"
//            "Misto"
//            "Cappucino"
//            "Flat White"

//            "Mocha"
//            "Frappuccino"
//            "Caramel Macchiato"
//            "White Chocolate Mocha"

//            "Iced Latte"
//            "Iced Mocha"
//            "Iced Americano"
//            "Iced Caramel Macchiato"
//            "Iced White Chocolate Mocha"
