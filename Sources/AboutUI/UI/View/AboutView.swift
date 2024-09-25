//
//  AboutView.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

#if os(macOS)
import SwiftUI

@available(macOS 15, *)
public struct AboutView<V: View>: View {
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
    
    @Environment(\.openWindow) private var openWindow
    
    var content: V
    
    let initFlag: Bool
    
    public init(@ViewBuilder content: @escaping () -> V) {
        self.content = content()
        self.initFlag = true
    }
    
    public init() where V == EmptyView {
        self.content = EmptyView()
        self.initFlag = false
    }
    
    public var body: some View {
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
                    
                    Text("Version \(self.version) (\(self.buildNumber))", bundle: .module)
                        .font(.system(size: 12.5))
                        .fontWeight(.light)
                        .foregroundStyle(Color.secondary)
                }
 
                VStack(alignment: .leading, spacing: 30) {
                    Text("Copyright \(self.copyright)", bundle: .module)
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
