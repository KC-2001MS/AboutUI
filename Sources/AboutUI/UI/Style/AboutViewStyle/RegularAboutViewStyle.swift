//
//  RegularAboutViewStyle.swift
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
public struct RegularAboutViewStyle: AboutViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(alignment: .center, spacing: 10) {
                VStack(alignment: .center, spacing: 5) {
                    configuration.appIcon
                        .scaledToFit()
                        .frame(width: 135)
                        .textSelection(.enabled)
                    
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
        .navigationTitle(Text("About \(configuration.appName.string)", bundle: .module))
        .padding(.horizontal, 40)
        .frame(minWidth: 200, idealWidth: 250, maxWidth: 300, minHeight: 200, idealHeight: 250, maxHeight: 300, alignment: .center)
    }
}

extension AboutViewStyle where Self == RegularAboutViewStyle {
    public static var regular: RegularAboutViewStyle {
        return RegularAboutViewStyle()
    }
}


#Preview {
    AboutView()
        .aboutViewStyle(.regular)
}
