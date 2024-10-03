//
//  OpenAboutAction.swift
//  AboutUI
//
//  Created by 茅根啓介 on 2024/10/03.
//

import SwiftUI

@MainActor
@preconcurrency
public struct OpenAboutAction: Sendable {
    @Environment(\.openWindow) private var openWindow
    
    func callAsFunction() {
        openWindow(id: "AboutUI:About")
    }
}
