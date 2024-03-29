//
//  CoinDataService.swift
//  Networking101
//
//  Created by Adam Khalifa on 25.02.2024.
//

import Foundation

class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    func fetchCoins(completion: @escaping([Coin]) -> Void) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {return}
            
            for coin in coins {
                print(coin.id)
            }
            completion(coins)
        }   
        .resume()
    }
}
