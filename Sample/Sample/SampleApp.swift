//
//  SampleApp.swift
//  Sample
//
//  Created by Keisuke Chinone on 2024/09/25.
//

import AboutUI
import SwiftUI

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        //        About {
        //            Button(action: {
        //
        //            }) {
        //                Text("Info")
        //                .frame(maxWidth: .infinity)
        //            }
        //            .buttonStyle(.bordered)
        //        }

        About()
    }
}
