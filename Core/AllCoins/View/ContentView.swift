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
            if let errorMsg = viewModel.errorMsg {
                Text("\(errorMsg)")
                
            } else {
                
                Text(viewModel.price)
                Text(viewModel.coin)
            }
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
