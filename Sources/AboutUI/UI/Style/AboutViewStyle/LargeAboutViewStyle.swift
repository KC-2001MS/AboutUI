//
//  LargeAboutViewStyle.swift
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
public struct LargeAboutViewStyle: AboutViewStyle {
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

extension AboutViewStyle where Self == LargeAboutViewStyle {
    public static var large: LargeAboutViewStyle {
        return LargeAboutViewStyle()
    }
}


#Preview {
    AboutView()
        .aboutViewStyle(.large)
}
