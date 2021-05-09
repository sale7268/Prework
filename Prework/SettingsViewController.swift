//
//  SettingsViewController.swift
//  Prework
//
//  Created by user190273 on 5/9/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var darkModeControl: UISegmentedControl!
    var mode = UserDefaults.standard.set(0, forKey: "isDarkMode")
    
    @IBAction func darkMode(_ sender: UISegmentedControl) {
        if(darkModeControl.selectedSegmentIndex == 1){
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
        print(currentColor)
        if(currentColor == 1){
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
    

}
