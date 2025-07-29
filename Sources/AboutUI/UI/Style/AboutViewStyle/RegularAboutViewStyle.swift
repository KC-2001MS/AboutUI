//
//  RegularAboutViewStyle.swift
//  AboutUI
//
//  Created by 茅根 啓介 on 2025/06/18.
//

import SwiftUI

/**
 An About view style that displays application information in a regular, compact layout.
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct RegularAboutViewStyle: AboutViewStyle {
    /// Creates a new instance of the regular About view style.
    public init() {}
    /**
     Creates the view representing the body of the regular About view style.
     
     - Parameter configuration: The configuration for the About view style.
     - Returns: A view that displays the About information using the regular style.
     */
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(alignment: .center, spacing: 10) {
                VStack(alignment: .center, spacing: 5) {
                    configuration.appIcon
                        .scaledToFit()
                        .frame(width: 135)
                    
                    configuration.appName
                        .font(.headline)
                        .textSelection(.enabled)
                        .lineLimit(1)
                }
            
                Text(
                    "\(configuration.appName.string) Version \(configuration.version.string)",
                    bundle: .module
                )
                .font(.caption)
                .textSelection(.enabled)
                .lineLimit(1)
            }

            Text("Copyright \(configuration.copyright.string)")
                .font(.footnote)
                .textSelection(.enabled)
                
                    
            if !configuration.content.isEmpty {
                VStack {
                    configuration.content
                }
            }
        }
        .windowResizeBehavior(.disabled)
        .navigationTitle(
            Text("About \(configuration.appName.string)", bundle: .module)
        )
        .padding(.horizontal, 40)
        .frame(
            minWidth: 200,
            idealWidth: 250,
            maxWidth: 300,
            minHeight: 200,
            idealHeight: 250,
            maxHeight: 300,
            alignment: .center
        )
    }
}

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension AboutViewStyle where Self == RegularAboutViewStyle {
    /// The regular About view style to use with an About view.
    public static var regular: RegularAboutViewStyle {
        return RegularAboutViewStyle()
    }
}


#Preview {
    AboutView()
        .aboutViewStyle(.regular)
}

