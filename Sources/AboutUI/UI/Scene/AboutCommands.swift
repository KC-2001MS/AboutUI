//
//  AboutCommands.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//


import SwiftUI

@available(macOS 15, *)
struct AboutCommands: Commands {
    let appName: String = {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }()
    
    @Environment(\.openWindow) private var openWindow
    
    init() {}
    
    var body: some Commands {
        CommandGroup(replacing: .appInfo) {
            Button(action: {
                openWindow(id: "AboutUI:About")
            }) {
                Text("About \(appName)", bundle: .module)
            }
        }
    }
}
