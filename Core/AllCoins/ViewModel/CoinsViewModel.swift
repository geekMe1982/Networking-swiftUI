//
//  CoinsViewModel.swift
//  Networking101
//
//  Created by Adam Khalifa on 22.02.2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var errorMsg: String?
    
    private let service = CoinDataService()
    
    init() {
        fetchCoins()
    }
    
    func fetchCoins() {
        service.fetchCoins { Result in
            DispatchQueue.main.async {
                switch Result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMsg = error.localizedDescription
                }
            }
            
        }
    }
}
