//
//  CoinsViewModel.swift
//  Networking101
//
//  Created by Adam Khalifa on 22.02.2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coin = ""
    @Published var price = ""
    
    init() {
        fetchPrice(coin: "ethereum")
    }
    
    func fetchPrice(coin: String) {
        print(Thread.current)

        
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        print("fetching data...")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            //checking the current thread
            print(Thread.current)
            // raw data
            print(data)
            guard let data = data else {return}
            guard let JSONObject = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else { return }
            //print JSON
            print(JSONObject)
            guard let value = JSONObject[coin] as? [String : Double] else {
              // print in case failed to parse
                print("Failed to parse data")
                return
            }
            //check date received
            print(value)
            guard let price = value["usd"] else { return }
            
            DispatchQueue.main.async {
                //which thread ?
                print(Thread.current)

                self.coin = coin.capitalized
                self.price = "$\(price)"
            }
          
        }.resume()
        print("Did reach EOF")
    }
    
}
