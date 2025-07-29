//
//  AboutScene.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

import SwiftUI

/**
 A scene that presents an interface about the application, typically shown as an “About” window or panel.
 
 Use this scene to display important app information, such as name, version, and copyright.
 */
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
    
    /// Creates an About scene with the specified content and label.
    /// - Parameters:
    ///   - content: The main content view for the About scene.
    ///   - label: The label view for the About scene.
    public init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.content = content()
        self.label = label()
    }
    
    /// Creates an About scene with the specified content and default label.
    /// - Parameter content: The main content view for the About scene.
    public init(@ViewBuilder content: @escaping () -> Content) where Label == DefaultAboutLinkLabel {
        self.content = content()
        self.label = DefaultAboutLinkLabel()
    }
    
    /// Creates an About scene with the default content and specified label.
    /// - Parameter label: The label view for the About scene.
    public init(@ViewBuilder label: @escaping () -> Label) where Content == EmptyView {
        self.content = EmptyView()
        self.label = label()
    }
    
    /// Creates an About scene with default content and default label.
    public init() where Content == EmptyView, Label == DefaultAboutLinkLabel {
        self.content = EmptyView()
        self.label = DefaultAboutLinkLabel()
    }
    
    /// The content and behavior of the scene.
    public var body: some Scene {
        Window(
            String(localized: "About \(appName)", bundle: Bundle.module),
            id: "AboutUI:About"
        ) {
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
/// Deprecated. Use `About` instead.
@available(*, deprecated, renamed: "About")
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public typealias AboutScene = About

