//
//  DefaultAboutViewStyle.swift
//  AboutUI
//
//  Created by 茅根 啓介 on 2025/06/18.
//

import SwiftUI

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultAboutViewStyle: AboutViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        LargeAboutViewStyle().makeBody(configuration: configuration)
    }
}

extension AboutViewStyle where Self == DefaultAboutViewStyle {
    public static var `default`: DefaultAboutViewStyle {
        return DefaultAboutViewStyle()
    }
}


#Preview {
    AboutView()
        .aboutViewStyle(.default)
}
