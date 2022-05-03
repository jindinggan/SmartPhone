//
//  ViewController.swift
//  Final Exam
//
//  Created by 靳丁干 on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var txtInches: UITextField!
    
    @IBOutlet weak var lblBMI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateBMI(_ sender: Any) {
        guard let weight: Int = Int(txtWeight.text!) else {return}
        guard let heightFeet: Int = Int(txtFeet.text!) else {return}
        guard let heightInches: Int = Int(txtInches.text!) else {return}
        let totalInches = heightFeet * 12 + heightInches
        let bmi = (Float(weight) / (Float(totalInches) * Float(totalInches))) * 703.0
        if(bmi < 18.5) {
            lblBMI.text = "BMI is \(bmi). Underweight"
        } else if (bmi > 18.5 && bmi < 24.9) {
            lblBMI.text = "BMI is \(bmi). Healthy"
        } else if (bmi > 25 && bmi < 29.9) {
            lblBMI.text = "BMI is \(bmi). Overweight"
        } else {
            lblBMI.text = "BMI is \(bmi). Obese"
        }
    }

}

