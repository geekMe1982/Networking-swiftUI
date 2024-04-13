//
//  ContentView.swift
//  Networking101
//
//  Created by Adam Khalifa on 22.02.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                HStack{
                    Text("\(coin.marketCapRank)")
                        .foregroundColor(.gray)
                    VStack(alignment: .leading){
                        Text(coin.name)
                            .fontWeight(.semibold)
                        Text(coin.symbol.uppercased())
                            .font(.footnote)
                    }
                }
            }
        }.overlay {
            if let error = viewModel.errorMsg {
                Text(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
