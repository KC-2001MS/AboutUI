//
//  ViewStyle.swift
//  AboutUI
//
//  Created by 茅根 啓介 on 2025/06/17.
//

import SwiftUI

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency public protocol AboutViewStyle {
    typealias Configuration = AboutViewStyleConfiguration
    
    associatedtype Body: View
    
    @preconcurrency @ViewBuilder func makeBody(configuration: Configuration) -> Body
}

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct AnyAboutViewStyle: AboutViewStyle {
    private var _makeBody: (Configuration) -> AnyView
    
    init<S: AboutViewStyle>(_ style: S) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}

@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct AboutViewStyleConfiguration: Sendable {
    var content: Content
    
    init(content: Content) {
        self.content = content
    }

    @preconcurrency struct Content: View {
        let isEmpty: Bool
        let content: any View
        init(_ content: some View) {
            self.content = content
            self.isEmpty = false
        }
        
        init() {
            self.content = EmptyView()
            self.isEmpty = true
        }
        
        var body: some View { AnyView(content) }
    }
    
    @preconcurrency var appIcon: AppIcon {
        return AppIcon()
    }
    
    struct AppIcon: View, Sendable {
        let appIcon: NSImage = NSImage(named: "AppIcon") ?? NSImage()
        
        nonisolated init() {}
            
        
        var body: some View {
            Image(nsImage: appIcon)
                .resizable()
        }
    }
    
    @preconcurrency  var appName: AppName {
        return AppName()
    }

    struct AppName: View, Sendable {
        let string: String = {
            return Bundle.main.localizedInfoDictionary?["CFBundleName"] as? String ?? Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        }()
        
        var body: some View {
            Text("\(string)", bundle: .module)
        }
    }
    
    @preconcurrency  var version: Version {
        return Version()
    }
    
    struct Version: View, Sendable {
        let string: String = {
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        }()
        
        var body: some View {
            Text("\(string)", bundle: .module)
        }
    }
    
    @preconcurrency  var buildNumber: BuildNumber {
        return BuildNumber()
    }
    
    struct BuildNumber: View, Sendable {
        let string: String = {
            return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
        }()
        
        var body: some View {
            Text("\(string)", bundle: .module)
        }
    }
    
     var copyright: Copyright {
        return Copyright()
    }
    
    struct Copyright: View, Sendable {
        let string: String = {
            return Bundle.main.infoDictionary?["NSHumanReadableCopyright"] as? String ?? ""
        }()
        
        var body: some View {
            Text("\(string)", bundle: .module)
        }
    }
}

