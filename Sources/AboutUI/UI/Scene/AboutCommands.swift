//
//  AboutCommands.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

import SwiftUI

/// Main menu on macOS to open an About scene
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct AboutCommands<Label: View>: Commands {
    var label: Label
    
    /// Creates an about link with a custom label.
    /// - Parameter label: A view to use as the label for this about link.
    public init(@ViewBuilder label: () -> Label) {
        self.label = label()
    }
    
    /// Creates a about link with the default system label.
    public init() where Label == DefaultAboutLinkLabel {
        self.label = DefaultAboutLinkLabel()
    }
    
    var body: some Commands {
        CommandGroup(replacing: .appInfo) {
            AboutLink {
                label
            }
        }
    }
}
