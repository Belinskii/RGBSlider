//
//  ViewController.swift
//  RGBSlider
//
//  Created by Марина Иванова on 29.04.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var rgbArea: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    //MARK: - Public properties
    unowned var delegate: SettingsViewControllerDelegate!
    var rgbAreaColor: UIColor!
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        //upgradeToolbar()
        
        navigationItem.hidesBackButton = true
        
        rgbArea.layer.cornerRadius = 15
        rgbArea.backgroundColor = rgbAreaColor
        
        setSliderValue(for: redSlider, greenSlider, blueSlider)
        setLabelValue(for: redLabel, greenLabel, blueLabel)
        setTFValue(for: redTF, greenTF, blueTF)
        
        activateRGBArea()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IBActions
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setLabelValue(for: redLabel)
            setTFValue(for: redTF)
        case greenSlider:
            setLabelValue(for: greenLabel)
            setTFValue(for: greenTF)
        default:
            setLabelValue(for: blueLabel)
            setTFValue(for: blueTF)
        }
        activateRGBArea()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(rgbArea.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    //MARK: - Private Methods
    private func activateRGBArea() {
        rgbArea.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setSliderValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: rgbAreaColor)
        colorSliders.forEach { slider in
            switch slider {
            case redSlider: redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    
    private func setLabelValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: label.text = string(from: redSlider)
            case greenLabel: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setTFValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF: textField.text = string(from: redSlider)
            case greenTF: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
            textField?.text = "1.00"
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
    
    //MARK: - UITextFieldDelegate
    extension SettingsViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            guard let text = textField.text else {
                showAlert(title: "Wrong format!", message: "Please enter correct value")
                return
            }
            guard let currentValue = Float(text), (0...1).contains(currentValue) else {
                showAlert(title: "Wrong format!", message: "Please enter correct value", textField: textField)
                return
            }
            
            switch textField {
            case redTF:
                redSlider.setValue(currentValue, animated: true)
                setLabelValue(for: redLabel)
            case greenTF:
                greenSlider.setValue(currentValue, animated: true)
                setLabelValue(for: greenLabel)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setLabelValue(for: blueLabel)
            }
            
        activateRGBArea()
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            let keyboardToolbar = UIToolbar()
            keyboardToolbar.sizeToFit()
            textField.inputAccessoryView = keyboardToolbar
            
            let doneButton = UIBarButtonItem(
                barButtonSystemItem: .done,
                target: textField,
                action: #selector(resignFirstResponder)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
        
        
    }



