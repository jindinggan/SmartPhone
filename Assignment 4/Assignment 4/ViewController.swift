//
//  ViewController.swift
//  Assignment 4
//
//  Created by 靳丁干 on 5/4/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate {

    

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getNameFromUser(_ sender: Any) {
        performSegue(withIdentifier: "SegueGetName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueGetName" {
            let getNameVC = segue.destination as! GetNameViewController
            guard let firstName = lblFirstName.text else {return}
            guard let lastName = lblLastName.text else {return}
            
            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
            
            getNameVC.sendFirstAndLastNameDelegate = self
        }
    }
    
    func setFirstAndLastName(firstName: String, lastName: String) {
        lblFirstName.text = firstName
        lblLastName.text = lastName
    }
    
    func setWelcomeText(welcomeText: String) {
        lblWelcome.text = welcomeText
    }
}

