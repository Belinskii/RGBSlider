//
//  ViewController.swift
//  RGBSlider
//
//  Created by Марина Иванова on 29.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var rgbArea: UIView!
    
    @IBOutlet var redNumber: UILabel!
    @IBOutlet var greenNumber: UILabel!
    @IBOutlet var blueNumber: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbArea.layer.cornerRadius = 15
        
        formatRedNumber()
        formatGreenNumber()
        formatBlueNumber()
    }
    
    //MARK: - IBActions
    @IBAction func redSliderAction() {
        formatRedNumber()
        activateRGBArea()
    }
    
    @IBAction func greenSliderAction() {
        formatGreenNumber()
        activateRGBArea()
    }
    
    @IBAction func blueSliderAction() {
        formatBlueNumber()
        activateRGBArea()
    }
    
    //MARK: - Private Methods
    private func activateRGBArea() {
        rgbArea.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    private func formatRedNumber() {
        redNumber.text = String(format: "%.2f", redSlider.value)
    }
    
    private func formatGreenNumber() {
        greenNumber.text = String(format: "%.2f", greenSlider.value)
    }
    
    private func formatBlueNumber() {
        blueNumber.text = String(format: "%.2f", blueSlider.value)
    }
}

