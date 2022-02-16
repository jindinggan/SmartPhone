//
//  ViewController.swift
//  Assignment3
//
//  Created by 靳丁干 on 2/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFavoriteFruit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        
        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.welcomeStr = "Welcome \(txtFirstName.text!), \(txtLastName.text!)"
            secondVC.favoriteFruit = "Your favorite fruit is \(txtFavoriteFruit.text!)"
        }
    }
}

