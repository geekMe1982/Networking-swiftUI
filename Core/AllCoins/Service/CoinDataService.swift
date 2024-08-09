//
//  CoinDataService.swift
//  Networking101
//
//  Created by Adam Khalifa on 25.02.2024.
//

import Foundation

class CoinDataService {
    //with marker cap and attributes
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    

}

extension CoinDataService {
    func fetchCoinsWithCompletionHandler(completion: @escaping(Result<[Coin], Error>) -> Void) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            //200
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {return}
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {return}

            for coin in coins {
                print(coin)
                
            }
            completion(.success(coins))
        }.resume()
    }
}
