//
//  ContentView.swift
//  Sample
//  
//  Created by Keisuke Chinone on 2024/09/25.
//


import SwiftUI
import AboutUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            AboutLink()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
