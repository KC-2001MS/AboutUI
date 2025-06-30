//
//  LargeAboutViewStyle.swift
//  AboutUI
//
//  Created by 茅根 啓介 on 2025/06/18.
//

import SwiftUI

/**
 An About view style that presents application information in a large, visually structured layout.
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct LargeAboutViewStyle: AboutViewStyle {
    /// Creates a new instance of the large About view style.
    public init() {}
    /**
     Creates the view representing the body of the large About view style.
     
     - Parameter configuration: The configuration for the About view style.
     - Returns: A view that displays the About information using the large style.
     */
    public func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 20) {
            configuration.appIcon
                .scaledToFit()
                .frame(width: 130)
                .padding(15)
            
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading, spacing: 0) {
                    configuration.appName
                        .font(.system(size: 37.5))
                    
                    Text("Version \(configuration.version.string) (\(configuration.buildNumber.string))", bundle: .module)
                        .font(.system(size: 12.5))
                        .fontWeight(.light)
                        .foregroundStyle(Color.secondary)
                }
 
                VStack(alignment: .leading, spacing: 30) {
                    Text("Copyright \(configuration.copyright.string)")
                        .font(.system(size: 9.5))
                        .fontWeight(.light)
                        .foregroundStyle(Color.secondary)
                    
                    if !configuration.content.isEmpty {
                        VStack {
                            configuration.content
                        }
                    }
                }
            }
            .frame(width: 310, alignment: .leading)
        }
        .windowResizeBehavior(.disabled)
        .windowMinimizeBehavior(.disabled)
        .toolbar(removing: .title)
        .toolbarBackground(.hidden, for: .windowToolbar)
        .containerBackground(Material.ultraThin, for: .window)
        .ignoresSafeArea()
        .padding(.vertical, 20)
        .padding(.horizontal,20)
        .frame(alignment: .center)
    }
}

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension AboutViewStyle where Self == LargeAboutViewStyle {
    /// The large About view style to use with an About view.
    public static var large: LargeAboutViewStyle {
        return LargeAboutViewStyle()
    }
}


#Preview {
    AboutView()
        .aboutViewStyle(.large)
}

