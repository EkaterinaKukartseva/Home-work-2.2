//
//  ViewController.swift
//  Home work 2.2
//
//  Created by EKATERINA  KUKARTSEVA on 03.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var valueRed: UILabel!
    @IBOutlet weak var valueGreen: UILabel!
    @IBOutlet weak var valueBlue: UILabel!
    @IBOutlet weak var valueAlpha: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderAlpha: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        setColorLabel()
        setColorView()
    }

    @IBAction func sliderAction(_ sender: Any) {
        setColorLabel()
        setColorView()
    }
    
    func setColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(sliderRed.value)/255, green: CGFloat(sliderGreen.value/225), blue: CGFloat(sliderBlue.value/225), alpha: CGFloat(sliderAlpha.value))
    }
    
    func setColorLabel() {
        valueRed.text = String(Int(sliderRed.value))
        valueGreen.text = String(Int(sliderGreen.value))
        valueBlue.text = String(Int(sliderBlue.value))
        valueAlpha.text = String(format: "%.02f", sliderAlpha.value)
    }
}

