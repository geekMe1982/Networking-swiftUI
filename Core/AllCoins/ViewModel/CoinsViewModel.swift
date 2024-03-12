//
//  CoinsViewModel.swift
//  Networking101
//
//  Created by Adam Khalifa on 22.02.2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    
    private let service = CoinDataService()
    
    init() {
        fetchCoins()
    }
    
    func fetchCoins() {
        service.fetchCoins{ coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
}
