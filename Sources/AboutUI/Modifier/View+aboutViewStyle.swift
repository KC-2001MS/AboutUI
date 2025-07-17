//
//  aboutViewStyle.swift
//  AboutUI
//
//  Created by 茅根 啓介 on 2025/06/17.
//

import SwiftUI

@available(macOS 15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public extension View {
    /**
     Sets the About view style for this view.
     
     - Parameter style: The AboutViewStyle to apply to this view.
     - Returns: A view modified to use the provided AboutViewStyle in its environment.
     */
    func aboutViewStyle(_ style: some AboutViewStyle) -> some View {
        self.environment(\.aboutViewStyle, AnyAboutViewStyle(style))
    }
}

