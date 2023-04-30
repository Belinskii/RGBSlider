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
    @IBOutlet var greenArea: UIView!
    @IBOutlet var blueArea: UIView!
    
    @IBOutlet var redNumber: UILabel!
    @IBOutlet var greenNumber: UILabel!
    @IBOutlet var blueNumber: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    private let rad: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redArea.layer.cornerRadius = rad
        greenArea.layer.cornerRadius = rad
        blueArea.layer.cornerRadius = rad
    }
    
    //MARK: - IBActions
    @IBAction func redSliderAction() {
    }
    @IBAction func greenSliderAction() {
    }
    @IBAction func blueSliderAction() {
    }
    

}

