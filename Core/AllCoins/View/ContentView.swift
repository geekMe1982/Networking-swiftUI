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
        HStack {
            Text(viewModel.coin)
            Text(viewModel.price)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
