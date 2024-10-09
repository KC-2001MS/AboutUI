//
//  OpenAboutAction.swift
//  AboutUI
//
//  Created by 茅根啓介 on 2024/10/03.
//

import SwiftUI

#if os(macOS)
/// An action that presents the about scene for an app.
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor
@preconcurrency
public struct OpenAboutAction: Sendable {
    @Environment(\.openWindow) private var openWindow
    
    @MainActor @preconcurrency public func callAsFunction() {
        openWindow(id: "AboutUI:About")
    }
}
#endif
