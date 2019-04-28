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

class ViewController9: UIViewController {
    
    static let TASTES = [
        "Milky"        ,
        "Blonde Roast" ,
        "Medium Roast" ,
        "Dark Roast"   ,
        "Sugar-Free"   ,
        "Kcal < 50"    ,
        "Kcal < 100"   ,
        "Kcal < 200"
    ];
    
    

    @IBOutlet weak var tastesPicker: UIMultiPicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tastesPicker.options = ViewController9.TASTES
        tastesPicker.selectedIndexes = [0,2]
        
        tastesPicker.addTarget(self, action: #selector(ViewController9.selected(_:)), for: .valueChanged)
        
        tastesPicker.color = .gray
        tastesPicker.tintColor = .black
        tastesPicker.font = .systemFont(ofSize: 24, weight: .bold)
        
        tastesPicker.highlight(2, animated: false) // centering "Bitter"
    }

    @IBAction func PRESSED(_ sender: UIButton, forEvent event: UIEvent) {
        print("AAA")
    }
    @objc func selected(_ sender: UIMultiPicker) {
        print(sender.selectedIndexes)
    }
}




class ViewController2: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    let optionArray = ["Blonde Roast", "Medium Roast", "Dark Roast", "Milky", "Sugar-Free", "Kcal < 50", "Kcal < 100", "Kcal < 200"]
    

    //Pre-setup IBOutlets
    @IBOutlet weak var optionPicker: UIPickerView!

    //FUNCTIONS
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return optionArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return optionArray[row]
    }
 

    
    //////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionPicker.delegate = self
        optionPicker.dataSource = self
        optionPicker.selectRow(optionArray.count/2, inComponent: 0, animated: false)
        
    }
    
    
}
