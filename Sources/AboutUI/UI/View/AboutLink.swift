//
//  AboutLink.swift
//  AboutUI
//
//  Created by 茅根啓介 on 2024/10/02.
//

import SwiftUI

#if os(macOS)
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public struct AboutLink<Label: View>: View {
    @Environment(\.openWindow) private var openWindow
    
    var label: Label
    
    public init(@ViewBuilder label: () -> Label) {
        self.label = label()
    }
    
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

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultAboutLinkLabel: View {
    let appName: String = {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }()
    
    public var body: some View {
//        Label("About \(appName)", systemImage: "info.circle")
        Label(String(localized: "About \(appName)", bundle: .module), systemImage: "info.circle")
    }
}
#endif
