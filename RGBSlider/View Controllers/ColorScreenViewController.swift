//
//  ColorScreenViewController.swift
//  RGBSlider
//
//  Created by Марина Иванова on 20.05.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setColor(_ color: UIColor)
}

final class ColorScreenViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.rgbAreaColor = view.backgroundColor
    }
}

//MARK: - SettingsViewControllerDelegate
extension ColorScreenViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}

