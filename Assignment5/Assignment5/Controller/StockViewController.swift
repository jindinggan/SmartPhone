//
//  StockViewController.swift
//  Assignment5
//
//  Created by 靳丁干 on 3/9/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    @IBOutlet weak var lblStockRating: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockRating(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else {return}
        let url = "\(ratingURL)\(symbol.uppercased())?apikey=\(apiKey)"
        SwiftSpinner.show("Getting Stock Rating for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
            }
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else {return}
            let quote = RatingQuote()
            quote.symbol = stock["symbol"].stringValue
            quote.date = stock["date"].stringValue
            quote.rating  = stock["rating"].stringValue
            
            self.lblStockRating.text = "Rating for \(quote.symbol) is \(quote.rating)"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
