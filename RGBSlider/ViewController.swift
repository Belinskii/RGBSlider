//
//  ViewController.swift
//  RGBSlider
//
//  Created by Марина Иванова on 29.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var redArea: UIView!
    
    @IBOutlet var redNumber: UILabel!
    @IBOutlet var greenNumber: UILabel!
    @IBOutlet var blueNumber: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redArea.layer.cornerRadius = CGFloat(20)
        
        redNumber.text = String(format: "%.2f", redSlider.value)
        greenNumber.text = String(format: "%.2f", greenSlider.value)
        blueNumber.text = String(format: "%.2f", blueSlider.value)
    }
    
    //MARK: - IBActions
    @IBAction func redSliderAction() {
        redNumber.text = String(format: "%.2f", redSlider.value)
        redArea.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func greenSliderAction() {
        greenNumber.text = String(format: "%.2f", greenSlider.value)
        redArea.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func blueSliderAction() {
        blueNumber.text = String(format: "%.2f", blueSlider.value)
        redArea.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    //MARK: - Private Methods
    

}

