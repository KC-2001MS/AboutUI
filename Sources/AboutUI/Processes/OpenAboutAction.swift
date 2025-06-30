//
//  OpenAboutAction.swift
//  AboutUI
//
//  Created by 茅根啓介 on 2024/10/03.
//

import SwiftUI

/**
 An action for presenting the About scene of an app.
 
 Use this action to programmatically display the standard About window or panel for your application.
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor
@preconcurrency
public struct OpenAboutAction: Sendable {
    @Environment(\.openWindow) private var openWindow
    
    /**
     Presents the About scene for the application when called.
     */
    @MainActor @preconcurrency public func callAsFunction() {
        openWindow(id: "AboutUI:About")
    }
}

