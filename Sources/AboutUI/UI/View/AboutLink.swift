//
//  AboutLink.swift
//  AboutUI
//
//  Created by 茅根啓介 on 2024/10/02.
//

import SwiftUI

/**
 A view that displays a button or other interactive element, which opens the About scene when activated.
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public struct AboutLink<Label: View>: View {
    @Environment(\.openWindow) private var openWindow
    
    var label: Label
    
    /// Creates an About link with a custom label.
    /// - Parameter label: A view to use as the label for this link.
    ///
    /// Creates an About link with the default system label.
    public init(@ViewBuilder label: () -> Label) {
        self.label = label()
    }
    
    /// Creates an About link with the default system label.
    public init() where Label == DefaultAboutLinkLabel {
        self.label = DefaultAboutLinkLabel()
    }
    
    /// The content and behavior of the About link.
    public var body: some View {
        Button(action: {
            openWindow(id: "AboutUI:About")
        }) {
            label
        }
    }
}

/**
 The default label view for an About link, typically displaying "About <AppName>" and an info icon.
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultAboutLinkLabel: View {
    let appName: String = {
        let string  = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let localizedString = Bundle.main.localizedInfoDictionary?["CFBundleName"] as? String ?? ""
        return localizedString != "" ? localizedString : string
    }()
    
    /// The content and layout of the default About link label.
    public var body: some View {
        Label(
            String(localized: "About \(appName)", bundle: Bundle.module),
            systemImage: "info.circle"
        )
    }
}
