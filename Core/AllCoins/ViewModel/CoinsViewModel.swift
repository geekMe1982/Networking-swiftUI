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
        Task {
            try await fetchCoins()
        }
    }
    
    func fetchCoins() async throws{
        try await service.fetchData()
    }
}
