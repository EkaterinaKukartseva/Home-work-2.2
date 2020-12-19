//
//  ViewController.swift
//  Home work 2.2
//
//  Created by EKATERINA  KUKARTSEVA on 03.12.2020.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func saveColor(color: UIColor)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    @IBOutlet weak var alphaTF: UITextField!
    
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        setColorForLabelAndTF()
        setColorView()
    }

    @IBAction func sliderAction(_ sender: Any) {
        setColorForLabelAndTF()
        setColorView()
    }
    
    @IBAction func doneAction(_ sender: Any) {
        if let viewBackgroundColor = colorView.backgroundColor {
            delegate?.saveColor(color: viewBackgroundColor)
        }
        
        delegate?.saveColor(color: colorView.backgroundColor ?? .white)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func setColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value/225), blue: CGFloat(blueSlider.value/225), alpha: CGFloat(alphaSlider.value))
    }
    
    func setColorForLabelAndTF() {
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        alphaLabel.text = String(format: "%.02f", alphaSlider.value)
        
        redTF.text = String(Int(redSlider.value))
        greenTF.text = String(Int(greenSlider.value))
        blueTF.text = String(Int(blueSlider.value))
        alphaTF.text = String(format: "%.02f", alphaSlider.value)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        setColorView()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setColorForLabelAndSlider(textField: redTF, label: redLabel, slider: redSlider)
        setColorForLabelAndSlider(textField: greenTF, label: greenLabel, slider: greenSlider)
        setColorForLabelAndSlider(textField: blueTF, label: blueLabel, slider: blueSlider)
        setColorForLabelAndSlider(textField: alphaTF, label: alphaLabel, slider: alphaSlider)
    }
    
    func setColorForLabelAndSlider(textField: UITextField, label: UILabel, slider: UISlider) {
        label.text = textField.text?.count ?? 0 > 0 ? textField.text : String(0)
        slider.value = isFloat(textField: textField)
    }
    
    func isFloat(textField: UITextField) -> Float {
        if let number = Float(textField.text ?? "") {
            return number
        }
        return 0
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard textField != alphaTF else {
            let customSet = NSCharacterSet(charactersIn:"0123456789.,").inverted
            let compSepByCharInSet = string.components(separatedBy: customSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            
            return string == numberFiltered
        }
        
        let customSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: customSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        return string == numberFiltered
    }
    
}
