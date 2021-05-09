//
//  ViewController.swift
//  Prework
//
//  Created by user190273 on 1/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var mode = UserDefaults.standard.set(0, forKey: "isDarkMode")
    
    @IBOutlet weak var darkMode: UISegmentedControl!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        if(billAmountLabel.text != String(0)){
            billAmountLabel.text = billAmountLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(billAmountLabel.text!)!
        } else {
            billAmountLabel.text = String(sender.tag-1)
            numberOnScreen = Double(billAmountLabel.text!)!
        }
    }
    
    @IBAction func eraseBtn(_ sender: UIButton) {
        billAmountLabel.text = String(0)
    }
    
    @IBAction func dotBtn(_ sender: UIButton) {
        billAmountLabel.text = billAmountLabel.text! + String(".")
        numberOnScreen = Double(billAmountLabel.text!)!
    }
    
    @IBAction func darModeAction(_ sender: UISegmentedControl) {
        if(darkMode.selectedSegmentIndex == 1){
            UserDefaults.standard.set(1, forKey: "isDarkMode")
            viewDidLoad()
        } else {
            UserDefaults.standard.set(0, forKey: "isDarkMode")
            viewDidLoad()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentColor =  UserDefaults.standard.integer(forKey: "isDarkMode")
        if(currentColor == 1){
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountLabel.text!) ?? 0
        
        //Get total by multiplying
        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update total amount
        totalLabel.text = String(format: "$%.2f",total)
        
    }
}

