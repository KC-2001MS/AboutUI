//
//  AboutScene.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//


import SwiftUI

//UtilityWindow

public struct AboutScene<Content>: Scene where Content : View {
    let appName: String = {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }()
    
    var content: Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    public init() where Content == EmptyView {
        self.content = EmptyView()
    }
    
    public var body: some Scene {
        Window("About \(appName)", id: "AboutUI:About") {
            AboutView {
                content
            }
        }
        .windowResizability(.contentSize)
        .commands {
            AboutCommands()
        }
    }
}
