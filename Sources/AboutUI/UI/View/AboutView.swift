//
//  AboutView.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

import SwiftUI

#if os(macOS)
/// View provided by About scene
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct AboutView<V: View>: View {
    let appName: String = {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }()
    
    let version: String = {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }()
    
    let buildNumber: String = {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }()
    
    let copyright: String = {
        return Bundle.main.infoDictionary?["NSHumanReadableCopyright"] as? String ?? ""
    }()
    
    var content: V
    
    let initFlag: Bool
    
    init(@ViewBuilder content: @escaping () -> V) {
        self.content = content()
        self.initFlag = true
    }
    
    init() where V == EmptyView {
        self.content = EmptyView()
        self.initFlag = false
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(nsImage: NSImage(named: "AppIcon") ?? NSImage())
                .resizable()
                .scaledToFit()
                .frame(width: 130)
                .padding(15)
            
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(appName)
                        .font(.system(size: 37.5))
                    
                    Text("Version \(self.version) (\(self.buildNumber))", bundle: Bundle.module)
                        .font(.system(size: 12.5))
                        .fontWeight(.light)
                        .foregroundStyle(Color.secondary)
                }
 
                VStack(alignment: .leading, spacing: 30) {
                    Text("Copyright \(self.copyright)", bundle: Bundle.module)
                        .font(.system(size: 9.5))
                        .fontWeight(.light)
                        .foregroundStyle(Color.secondary)
                    
                    if initFlag {
                        VStack {
                            content
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

#Preview {
    AboutView()
}
#endif
