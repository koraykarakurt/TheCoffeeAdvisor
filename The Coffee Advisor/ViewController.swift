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
        "No Milk"      ,
        "No Sugar"     ,
        "Blonde Roast" ,
        "Medium Roast" ,
        "Dark Roast"   ,
        "Kcal < 50"    ,
        "Kcal < 100"   ,
        "Kcal < 200"
    ];
    
    @IBOutlet weak var tastesPicker: UIMultiPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let saved_selectedIndexes = UserDefaults.standard.integer(forKey: "UIMultiPickerIndexes")
        let defaults = UserDefaults.standard
        let saved_selectedIndexes = defaults.object(forKey:"UIMultiPickerIndexes") as? [Int] ?? [Int]()
        print(saved_selectedIndexes)
        
        
        
        tastesPicker.options = ViewController9.TASTES
        tastesPicker.selectedIndexes = saved_selectedIndexes
        //tastesPicker.selectedIndexes = [saved_selectedIndexes]

        tastesPicker.addTarget(self, action: #selector(ViewController9.selected(_:)), for: .valueChanged)
        
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



 
