//
//  AboutScene.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

import SwiftUI

/// A scene presenting an interface about the application.
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct About<Content: View, Label: View>: Scene where Content : View {
    let appName: String = {
        let string  = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let localizedString = Bundle.main.localizedInfoDictionary?["CFBundleName"] as? String ?? ""
        return localizedString != "" ? localizedString : string
    }()
    
    var content: Content
    
    var label: Label
    
    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder label: @escaping () -> Label) {
        self.content = content()
        self.label = label()
    }
    
    public init(@ViewBuilder content: @escaping () -> Content) where Label == DefaultAboutLinkLabel {
        self.content = content()
        self.label = DefaultAboutLinkLabel()
    }
    
    public init(@ViewBuilder label: @escaping () -> Label) where Content == EmptyView {
        self.content = EmptyView()
        self.label = label()
    }
    
    public init() where Content == EmptyView, Label == DefaultAboutLinkLabel {
        self.content = EmptyView()
        self.label = DefaultAboutLinkLabel()
    }
    
    public var body: some Scene {
        Window(String(localized: "About \(appName)", bundle: Bundle.module), id: "AboutUI:About") {
            AboutView {
                content
            }
        }
        .windowResizability(.contentSize)
        .commands {
            AboutCommands {
                label
            }
        }
    }
}

@available(macOS 15, *)
@available(*, deprecated, renamed: "About")
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public typealias AboutScene = About
