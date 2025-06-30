//
//  aboutStyle.swift
//  AboutUI
//
//  Created by 茅根 啓介 on 2025/06/30.
//

import SwiftUI

@available(macOS 15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public extension Scene {
    /**
     Sets the About view style for this scene.
     
     - Parameter style: The style to apply to the About view within this scene.
     - Returns: A modified scene that uses the specified AboutViewStyle for displaying about information.
     */
    func aboutStyle(_ style: some AboutViewStyle) -> some Scene {
        self.environment(\.aboutViewStyle, AnyAboutViewStyle(style))
    }
}

