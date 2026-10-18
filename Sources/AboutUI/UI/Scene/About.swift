//
//  AboutScene.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

import SwiftUI

/**
 A SwiftUI Scene that presents a native “About” window for your app on macOS.

 About provides a dedicated window titled “About <App Name>” and wires up a
 corresponding menu command so users can open it from the standard app menu.
 You can supply custom content for the window and optionally customize the
 label used in the menu command.

 - Displays a window whose title is localized as “About <App Name>”.
 - Registers an “About” menu command that opens the window.
 - Uses the app’s localized bundle name (`CFBundleName`) for the title.
 - Restricts window resizing to the size of its content.

 ## Generics
 - Content: The view shown inside the About window.
 - Label: The view used as the label for the About menu command.

 ## Customization
 - Provide a custom `Content` to show additional details or actions relevant to users,
   such as links to support pages, license information, or buttons that open help.
 - Provide a custom `Label` to tailor the menu command’s appearance.
 - If you omit either, sensible defaults are used:
   - `Content` defaults to `EmptyView`.
   - `Label` defaults to `DefaultAboutLinkLabel`.

 > Important:  The About scene automatically includes core app metadata (such as the app name
   and version). Avoid duplicating these in your custom content. Instead, focus
   on supplemental information and actions (support, help, acknowledgments, etc.).

 ## Initializers
 - ``init(content:label:)``
   Provide both the window content and the menu command label.
 - ``init(content:)``
   Provide custom window content and use the default menu command label.
 - ``init(label:)``
   Provide a custom menu command label with empty window content.
 - ``init()``
   Use default content and default label.

 ## Example
 ```swift
 @main
 struct MyApp: App {
     var body: some Scene {
         // About window with default labels and content (no additions)
         About()

         // Example of displaying additional actions such as support or help.
         // Note: The app name and version are automatically displayed in About, so do not duplicate them here.
         About {
             VStack(alignment: .leading, spacing: 12) {
                 Link("Support Website", destination: URL(string: "https://example.com/support")!)
                 Link("User Guide", destination: URL(string: "https://example.com/help")!)
                 Button("Check for updates…") {
                     // Initiate the app update flow
                 }
             }
             .padding()
         }
     }
 }
```

 ## Localization
 - The window title string is localized from the package bundle (`Bundle.module`).
 - The app name is resolved from the main bundle’s `CFBundleName`,
   preferring the localized value when available.

 ## Accessibility
 - Ensure custom content includes appropriate accessibility labels
   and traits to provide a great experience for all users.

 ## Notes
 - The window’s resizability is constrained to its content size to maintain
   a compact, consistent About presentation.
 - This type supersedes ``AboutScene`` (deprecated alias).
 */
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct About<Content: View, Label: View>: Scene where Content : View {
    let appName: String = {
        let string  = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let localizedString = Bundle.main.localizedInfoDictionary?["CFBundleName"] as? String ?? ""
        return localizedString != "" ? localizedString : string
    }()
    
    var content: Content
    
    var label: Label
    
    /// Creates an About scene with the specified content and label.
    /// - Parameters:
    ///   - content: The main content view for the About scene.
    ///   - label: The label view for the About scene.
    public init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.content = content()
        self.label = label()
    }
    
    /// Creates an About scene with the specified content and default label.
    /// - Parameter content: The main content view for the About scene.
    public init(@ViewBuilder content: @escaping () -> Content) where Label == DefaultAboutLinkLabel {
        self.content = content()
        self.label = DefaultAboutLinkLabel()
    }
    
    /// Creates an About scene with the default content and specified label.
    /// - Parameter label: The label view for the About scene.
    @_disfavoredOverload
    public init(@ViewBuilder label: @escaping () -> Label) where Content == EmptyView {
        self.content = EmptyView()
        self.label = label()
    }

    /// Creates an About scene with default content and default label.
    public init() where Content == EmptyView, Label == DefaultAboutLinkLabel {
        self.content = EmptyView()
        self.label = DefaultAboutLinkLabel()
    }
    
    /// The content and behavior of the scene.
    public var body: some Scene {
        Window(
            String(localized: "About \(appName)", bundle: Bundle.module),
            id: "AboutUI:About"
        ) {
            AboutView {
                content
            }
        }
        .windowResizability(.contentSize)
        .commands {
            AboutCommands {
                label
            }
        }
    }
}

@available(macOS 15, *)
/// Deprecated. Use `About` instead.
@available(*, deprecated, renamed: "About")
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public typealias AboutScene = About

