//
//  SampleApp.swift
//  Sample
//  
//  Created by Keisuke Chinone on 2024/09/25.
//


import SwiftUI
import AboutUI

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
//        AboutScene {
//            Button(action: {
//                
//            }) {
//                Text("Info")
//                .frame(maxWidth: .infinity)
//            }
//            .buttonStyle(.bordered)
//        }
        
        AboutScene()
    }
}
