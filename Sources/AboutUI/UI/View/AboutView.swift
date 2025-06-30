//
//  AboutView.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

import SwiftUI

/**
 A view for displaying information about the application using a specified style and optional sub-icon.
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct AboutView<V: View>: View {
    @Environment(\.aboutViewStyle) private var aboutViewStyle: AnyAboutViewStyle
    
    var subIcon: Image
    
    var content: V
    
    /// Creates an About view with the default sub-icon and the specified content.
    /// - Parameter content: The content to display in the About view.
    public init(@ViewBuilder content: @escaping () -> V) {
        self.subIcon = Image(systemName: "info.circle")
        self.content = content()
    }
    
    /// Creates an About view with the specified sub-icon and content.
    /// - Parameters:
    ///   - subIcon: The image to display as the sub-icon.
    ///   - content: The content to display in the About view.
    public init(subIcon: Image ,@ViewBuilder content: @escaping () -> V) {
        self.subIcon = subIcon
        self.content = content()
    }
    
    /// Creates an About view with the default sub-icon and no content.
    public init() where V == EmptyView {
        self.subIcon = Image(systemName: "info.circle")
        self.content = EmptyView()
    }
    
    /// Creates an About view with the specified sub-icon and no content.
    /// - Parameter subIcon: The image to display as the sub-icon.
    public init(subIcon: Image) where V == EmptyView {
        self.subIcon = subIcon
        self.content = EmptyView()
    }
    
    /// The content and layout for the About view.
    public var body: some View {
        aboutViewStyle
            .makeBody(
                configuration: .init(
                    subIcon: subIcon,
                    content: .init(content)
                )
            )
    }
}

#Preview {
    AboutView()
}
