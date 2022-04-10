//
//  StockTableViewCell.swift
//  Midterm
//
//  Created by 靳丁干 on 4/10/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockTableViewCell:
    UITableViewCell {

    

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    
    var sendStockDeletgate: SendStockDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func getPriceAction(_ sender: Any) {
        guard let symbol = lblSymbol.text else {return}
        let url = "\(quotingURL)\(symbol.uppercased())?apikey=\(apiKey)"
        SwiftSpinner.show("Getting Stock Rating for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
            }
            let stocks = JSON(response.data!).array
            guard let stock = stocks!.first else {return}
            let quote = StockQuote()
            quote.name = stock["name"].stringValue
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].doubleValue
            quote.dayHigh = stock["dayHigh"].doubleValue
            quote.dayLow = stock["dayLow"].doubleValue
            
            self.sendStockDeletgate?.sendStockData(StockQuote: quote)
//            let quote = RatingQuote()
//            quote.symbol = stock["symbol"].stringValue
//            quote.date = stock["date"].stringValue
//            quote.rating  = stock["rating"].stringValue
//
//            self.lblStockRating.text = "Rating for \(quote.symbol) is \(quote.rating)"
        }
    }
//    @IBAction func getPriceActions(_ sender: Any) {
//        guard let symbol = lblSymbol.text else {return}
//        let url = "\(quotingURL)\(symbol.uppercased())?apikey=\(apiKey)"
//        SwiftSpinner.show("Getting Stock Rating for \(symbol)")
//        AF.request(url).responseJSON { response in
//            SwiftSpinner.hide(nil)
//            if response.error != nil {
//                print(response.error!)
//            }
//            let stocks = JSON(response.data!).array
//            guard let stock = stocks!.first else {return}
//            let quote = StockQuote()
//            quote.name = stock["name"].stringValue
//            quote.symbol = stock["symbol"].stringValue
//            quote.price = stock["price"].doubleValue
//            quote.dayHigh = stock["dayHigh"].doubleValue
//            quote.dayLow = stock["dayLow"].doubleValue
//
//            self.sendStockDeletgate?.sendStockData(StockQuote: quote)
////            let quote = RatingQuote()
////            quote.symbol = stock["symbol"].stringValue
////            quote.date = stock["date"].stringValue
////            quote.rating  = stock["rating"].stringValue
////
////            self.lblStockRating.text = "Rating for \(quote.symbol) is \(quote.rating)"
//        }
    }
    
