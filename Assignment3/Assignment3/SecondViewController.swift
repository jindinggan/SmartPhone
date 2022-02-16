//
//  SecondViewController.swift
//  Assignment3
//
//  Created by 靳丁干 on 2/15/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblFavoriteFruit: UILabel!
    var welcomeStr = ""
    var favoriteFruit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = welcomeStr
        lblFavoriteFruit.text = favoriteFruit
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
