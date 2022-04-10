//
//  ViewController.swift
//  Midterm
//
//  Created by 靳丁干 on 4/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,SendStockDelegate {

    

    
    @IBOutlet weak var lblCompanyName: UILabel!
    
    
    @IBOutlet weak var lblCompanySymbol: UILabel!
    
    
    @IBOutlet weak var lblPrice: UILabel!
    
    
    @IBOutlet weak var lblDayHigh: UILabel!
    
    
    @IBOutlet weak var lblDayLow: UILabel!
    //    @IBOutlet weak var lblCompanyName: UILabel!
//
//    @IBOutlet weak var lblCompanySymbol: UILabel!
//
//    @IBOutlet weak var lblPrice: UILabel!
//
//
//    @IBOutlet weak var lblDayHigh: UILabel!
//
//    @IBOutlet weak var lblDayLow: UILabel!
    let companies = ["FB", "AAPL", "GOOG", "MSFT", "AMZN"]
    
    let companyNames = ["Meta Platforms, Inc.", "Apple Inc.", "Alphabet Inc.", "Microsoft Corporation", "Amazon.com, Inc."]
    @IBOutlet weak var tableView: UITableView!

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = companies[indexPath.row]
//        return cell
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
        
        cell.lblName.text = companyNames[indexPath.row]
        cell.lblSymbol.text = companies[indexPath.row]
        cell.sendStockDeletgate = self
        return cell
    }
    
    func sendStockData(StockQuote: StockQuote) {
        self.lblCompanyName.text = "Company Name: \(StockQuote.name)"
        self.lblCompanySymbol.text = "Company Symbol: \(StockQuote.symbol)"
        self.lblPrice.text = "Price: \(StockQuote.price)$"
        self.lblDayHigh.text = "Day High: \(StockQuote.dayHigh)$"
        self.lblDayLow.text = "Day Low: \(StockQuote.dayLow)$"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

    
}

