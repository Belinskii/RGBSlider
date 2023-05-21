//
//  ColorScreenViewController.swift
//  RGBSlider
//
//  Created by Марина Иванова on 20.05.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setNewValues(for redSliderChangedValue: Float, and greenSliderChangedValue: Float,and blueSliderChangedValue: Float)
}

class ColorScreenViewController: UIViewController {
    
    var redSliderValue: Float = 0.5
    var greenSliderValue: Float = 0.5
    var blueSliderValue: Float = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.redSliderValue = redSliderValue
        settingsVC.greenSliderValue = greenSliderValue
        settingsVC.blueSliderValue = blueSliderValue
        settingsVC.delegate = self
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
    }
    
}

//MARK: - SettingsViewControllerDelegate
extension ColorScreenViewController: SettingsViewControllerDelegate {
    func setNewValues(for redSliderChangedValue: Float, and greenSliderChangedValue: Float, and blueSliderChangedValue: Float) {
        redSliderValue = redSliderChangedValue
        greenSliderValue = greenSliderChangedValue
        blueSliderValue = blueSliderChangedValue
        view.backgroundColor = UIColor(red: CGFloat(redSliderChangedValue),
                                       green: CGFloat(greenSliderChangedValue),
                                       blue: CGFloat(blueSliderChangedValue),
                                       alpha: 1)
    }
    
}

