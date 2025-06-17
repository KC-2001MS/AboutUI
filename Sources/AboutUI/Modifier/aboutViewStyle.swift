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
    func aboutViewStyle(_ style: some AboutViewStyle) -> some View {
        self.environment(\.aboutViewStyle, AnyAboutViewStyle(style))
    }
}
