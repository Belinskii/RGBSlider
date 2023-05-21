//
//  ViewController.swift
//  RGBSlider
//
//  Created by Марина Иванова on 29.04.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    var redSliderValue: Float!
    var greenSliderValue: Float!
    var blueSliderValue: Float!
    
    unowned var delegate: SettingsViewControllerDelegate!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upgradeToolbar()
        
        navigationItem.hidesBackButton = true
        
        rgbArea.layer.cornerRadius = 15
        
        formatElements(textField: redTF, slider: redSlider, label: redLabel, value: redSliderValue)
        formatElements(textField: greenTF, slider: greenSlider, label: greenLabel, value: greenSliderValue)
        formatElements(textField: blueTF, slider: blueSlider, label: blueLabel, value: blueSliderValue)
        
        activateRGBArea()
    }
    
    //MARK: - IBActions
    
    @IBAction func sliderAction(_ sender: UISlider) {
        activateRGBArea()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTF.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTF.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTF.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setNewValues(for: redSlider.value, and: greenSlider.value, and: blueSlider.value)
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
    
    private func formatElements(textField: UITextField, slider: UISlider, label: UILabel, value: Float) {
        let numberKeyboard = UIKeyboardType.numberPad
        slider.value = value
        label.text = string(from: slider)
        textField.text = string(from: slider)
        textField.keyboardType = numberKeyboard
    }
    
    private func checkTFValue(textField: UITextField, slider: UISlider, label: UILabel) {
        guard let inputText = textField.text, !inputText.isEmpty else {
            slider.value = 0
            textField.text = String(format: "%.2f", slider.value)
            label.text = textField.text
            activateRGBArea()
            return
        }
        slider.value = Float(textField.text!)!
        textField.text = String(format: "%.2f", slider.value)
        label.text = textField.text
    }
    
    private func upgradeToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(toolbarDoneButtonTapped))
        
        toolbar.items = [flexibleSpace, doneButton]
        
        redTF.inputAccessoryView = toolbar
        greenTF.inputAccessoryView = toolbar
        blueTF.inputAccessoryView = toolbar
    }
    
    @objc func toolbarDoneButtonTapped() {
        
        view.endEditing(true)
        
        checkTFValue(textField: redTF, slider: redSlider, label: redLabel)
        checkTFValue(textField: greenTF, slider: greenSlider, label: greenLabel)
        checkTFValue(textField: blueTF, slider: blueSlider, label: blueLabel)
        
        redTF.resignFirstResponder()
        greenTF.resignFirstResponder()
        blueTF.resignFirstResponder()
        
        activateRGBArea()
    }
    
}



