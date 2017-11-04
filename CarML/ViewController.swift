//
//  ViewController.swift
//  CarML
//
//  Created by Michel on 10/30/17.
//  Copyright © 2017 coolnerd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var modelSegmentedCtrl: UISegmentedControl!
    @IBOutlet weak var extrasSwitch: UISwitch!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var kmSlider: UISlider!
    @IBOutlet weak var conditionsSegmented: UISegmentedControl!
    @IBOutlet weak var carPrice: UILabel!
    
    let cars  = Cars()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
         self.stackView.setCustomSpacing(20, after: self.modelSegmentedCtrl)
        self.stackView.setCustomSpacing(20, after: extrasSwitch)
        self.stackView.setCustomSpacing(20, after: kmSlider)
         */
        
        self.changeValue()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func changeValue() {
        
        //  1   format values
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        let formattedKm = formatter.string(for: self.kmSlider.value) ?? "0"
        self.kmLabel.text = "Kilometers: \(formattedKm) kms."
        
        //  make numbers
        if let prediction = try? cars.prediction(
            modelo: Double(self.modelSegmentedCtrl.selectedSegmentIndex),
            extras: self.extrasSwitch.isOn ? Double(1.0) : Double(0.0),
            kilometraje: Double(self.kmSlider.value),
            estado: Double(self.conditionsSegmented.selectedSegmentIndex)){
            
            let clampValue = max(500, prediction.price)
            formatter.numberStyle = .currency
            
            self.carPrice.text = formatter.string(for: clampValue)
            
        } else{
            
            self.carPrice.text = "Error"
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
}

