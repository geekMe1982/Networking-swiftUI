//
//  CoinDataService.swift
//  Networking101
//
//  Created by Adam Khalifa on 25.02.2024.
//

import Foundation


class CoinDataService {
    
    func fetchPrice(coin: String, completion: @escaping(Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
//                    self.errorMsg = error.localizedDescription
                    return
                }
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
            print("price in service \(price)")
            completion(price)
        }
        .resume()
    }
}
