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
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
    }

    @IBAction func sliderAction(_ sender: Any) {
        valueRed.text = numberFormatter.string(from: NSNumber(value: sliderRed.value))
        valueGreen.text = numberFormatter.string(from: NSNumber(value: sliderGreen.value))
        valueBlue.text = numberFormatter.string(from: NSNumber(value: sliderBlue.value))
        valueAlpha.text = numberFormatter.string(from: NSNumber(value: sliderAlpha.value))
        
        colorView.backgroundColor = UIColor(red: CGFloat(sliderRed.value)/255, green: CGFloat(sliderGreen.value/225), blue: CGFloat(sliderBlue.value/225), alpha: CGFloat(sliderAlpha.value))
    }
    
}

