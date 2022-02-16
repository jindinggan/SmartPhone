//
//  ViewController.swift
//  Assignment3Part2
//
//  Created by 靳丁干 on 2/16/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let arr = ["apple", "pear", "banana", "guava", "mongo", "peach", "cherry", "watermelon", "orange", "pineapple"]
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.imgView.image = UIImage(named: arr[indexPath.row])
        cell.lblImage.text = arr[indexPath.row]
        
        return cell
    }
    



}

