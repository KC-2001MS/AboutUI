//
//  DefaultAboutViewStyle.swift
//  AboutUI
//
//  Created by 茅根 啓介 on 2025/06/18.
//

import SwiftUI

/**
 The default visual style for an About view.
 
 Use this style to display About information in a standard, visually appealing format.
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultAboutViewStyle: AboutViewStyle {
    /// Creates a new instance of the default About view style.
    public init() {}
    /**
     Creates the view representing the body of the default About view style.
     
     - Parameter configuration: The configuration for the About view style.
     - Returns: A view that displays the About information using the default style.
     */
    public func makeBody(configuration: Configuration) -> some View {
        LargeAboutViewStyle().makeBody(configuration: configuration)
    }
}

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension AboutViewStyle where Self == DefaultAboutViewStyle {
    /**
     The default About view style instance.
     */
    public static var `default`: DefaultAboutViewStyle {
        return DefaultAboutViewStyle()
    }
}


#Preview {
    AboutView()
        .aboutViewStyle(.default)
}

