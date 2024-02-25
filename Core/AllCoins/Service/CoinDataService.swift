//
//  CoinDataService.swift
//  Networking101
//
//  Created by Adam Khalifa on 25.02.2024.
//

import Foundation


class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=3&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    func fetchCoins() {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            let dataString = String(data: data, encoding: .utf8)
            print(dataString)
        }.resume()
    }
    
    func fetchPrice(coin: String, completion: @escaping(Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                //                    self.errorMsg = error.localizedDescription
                return
            }
            guard let HTTPResponse = response as? HTTPURLResponse else {
                //                self.errorMsg = "bad response"
                return
            }
            guard HTTPResponse.statusCode == 200 else {
                //                self.errorMsg = "worked \(HTTPResponse.statusCode)"
                return
            }
            // raw data
            guard let data = data else {return}
            guard let JSONObject = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else { return }
            //print JSON
            guard let value = JSONObject[coin] as? [String : Double] else {
                // print in case failed to parse
                print("Failed to parse data")
                return
            }
            guard let price = value["usd"] else { return }
            completion(price)
        }
        .resume()
    }
}
