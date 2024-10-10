//
//  AboutLink.swift
//  AboutUI
//
//  Created by 茅根啓介 on 2024/10/02.
//

import SwiftUI

#if os(macOS)
/// A view that opens the About scene defined by an app.
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public struct AboutLink<Label: View>: View {
    @Environment(\.openWindow) private var openWindow
    
    var label: Label
    
    /// Creates an about link with a custom label.
    /// - Parameter label: A view to use as the label for this about link.
    public init(@ViewBuilder label: () -> Label) {
        self.label = label()
    }
    
    /// Creates a about link with the default system label.
    public init() where Label == DefaultAboutLinkLabel {
        self.label = DefaultAboutLinkLabel()
    }
    
    public var body: some View {
        Button(action: {
            openWindow(id: "AboutUI:About")
        }) {
            label
        }
    }
}

/// The default label to use for an about link.
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
    
    public var body: some View {
        Label(String(localized: "About \(appName)", bundle: Bundle.module), systemImage: "info.circle")
    }
}
#endif
