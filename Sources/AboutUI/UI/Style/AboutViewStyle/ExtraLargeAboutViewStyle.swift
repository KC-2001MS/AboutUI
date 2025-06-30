//
//  ExtraLargeAboutViewStyle.swift
//  AboutUI
//
//  Created by 茅根 啓介 on 2025/06/18.
//

import SwiftUI

/**
 An About view style that displays application information in an extra-large, visually rich layout.
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ExtraLargeAboutViewStyle: AboutViewStyle {
    /// Creates a new instance of the extra-large About view style.
    public init() {}
    /**
     Creates the view representing the body of the extra-large About view style.
     
     - Parameter configuration: The configuration for the About view style.
     - Returns: A view that displays the About information using the extra-large style.
     */
    public func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: 10) {
                configuration.appIcon
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .offset(y: -200 / 10)
                    .padding(.horizontal,10)
            
            VStack(alignment: .leading, spacing: 50) {
                VStack(alignment: .leading, spacing: 15) {
                    configuration.subIcon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 37.5, height: 37.5)
                        .font(.system(size: 37.5))
                        .foregroundStyle(Color.secondary)
                        .alignmentGuide(.top) { d in d[.top] }
                    
                    configuration.appName
                        .font(.largeTitle)
                    
                    Text("Version \(configuration.version.string)", bundle: .module)
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
            .frame(width: 350, alignment: .leading)
        }
        .windowResizeBehavior(.disabled)
        .windowMinimizeBehavior(.disabled)
        .toolbar(removing: .title)
        .toolbarBackground(.hidden, for: .windowToolbar)
        .ignoresSafeArea()
        .padding(10)
        .frame(alignment: .center)
    }
}

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension AboutViewStyle where Self == RegularAboutViewStyle {
    /// The extra-large About view style to use with an About view.
    public static var extraLarge: ExtraLargeAboutViewStyle {
        return ExtraLargeAboutViewStyle()
    }
}


#Preview {
    AboutView()
        .aboutViewStyle(.extraLarge)
}

