//
//  ViewController.swift
//  Color Slider
//
//  Created by Shamin Vladimir on 27.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var colourView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colourView.layer.cornerRadius = colourView.frame.height / 6
        setColourView()
        setLabelsValue(to: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColourView()
        switch sender.tag {
        case 0: redValueLabel.text = roundedValue(from: sender)
        case 1: greenValueLabel.text = roundedValue(from: sender)
        case 2: blueValueLabel.text = roundedValue(from: sender)
        default: break
        }
    }
    
    // MARK: Private functions
    private func setColourView() {
        colourView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    
    private func roundedValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setLabelsValue(to labels: UILabel...) {
        for label in labels {
            switch label.tag {
            case 0: redValueLabel.text = roundedValue(from: redSlider)
            case 1: greenValueLabel.text = roundedValue(from: greenSlider)
            case 2: blueValueLabel.text = roundedValue(from: blueSlider)
            default: break
            }
        }
    }
}

