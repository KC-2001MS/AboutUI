//
//  AboutView.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

import SwiftUI

/// View provided by About scene
@available(macOS 15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct AboutView<V: View>: View {
    @Environment(\.openWindow) private var openWindow
    
    
    @Environment(\.aboutViewStyle) private var aboutViewStyle: AnyAboutViewStyle
    
    var content: V
    
    public init(@ViewBuilder content: @escaping () -> V) {
        self.content = content()
    }
    
    public init() where V == EmptyView {
        self.content = EmptyView()
    }
    
    public var body: some View {
        aboutViewStyle.makeBody(configuration: .init(content: .init(content)))
    }
}

#Preview {
    AboutView()
}
