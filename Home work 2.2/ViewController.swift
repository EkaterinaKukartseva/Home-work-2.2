//
//  ViewController.swift
//  Home work 2.2
//
//  Created by EKATERINA  KUKARTSEVA on 19.12.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingVC = segue.destination as? SettingsViewController {
            settingVC.delegate = self
        }
    }

}

extension ViewController: SettingsViewControllerDelegate {
    
    func saveColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    
}
