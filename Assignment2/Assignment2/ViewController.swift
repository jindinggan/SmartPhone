//
//  ViewController.swift
//  Assignment2
//
//  Created by 靳丁干 on 2/8/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    let imageNames = ["apple", "pear", "banana", "guava", "mongo", "peach", "cherry", "watermelon", "orange", "pineapple"]
    
//    let images = ["image 1", "image 2", "image 3", "image 4", "image 5", "image 6", "image 7", "image 8", "image 9", "image 10"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cell.imgView.image = UIImage(named: imageNames[indexPath.row])
        cell.lblCell.text = imageNames[indexPath.row]

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        // Do any additional setup after loading the view.
    }

    
}

