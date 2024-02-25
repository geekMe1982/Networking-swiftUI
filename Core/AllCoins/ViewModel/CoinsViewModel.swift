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
    @Published var errorMsg: String?
    
    private let service = CoinDataService()
    init() {
        fetchPrice(coin: "bitcoin")
    }
    
    func fetchPrice(coin: String) {
        service.fetchPrice(coin: coin) { priceFromService in
            
        }
    }
}
