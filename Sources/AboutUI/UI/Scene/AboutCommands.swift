//
//  AboutCommands.swift
//  AboutUI
//  
//  Created by Keisuke Chinone on 2024/09/25.
//

import SwiftUI

#if os(macOS)
/// Main menu on macOS to open an About scene
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct AboutCommands: Commands {
    let appName: String = {
        let string  = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let localizedString = Bundle.main.localizedInfoDictionary?["CFBundleName"] as? String ?? ""
        return localizedString != "" ? localizedString : string
    }()
    
    @Environment(\.openWindow) private var openWindow
    
    init() {}
    
    var body: some Commands {
        CommandGroup(replacing: .appInfo) {
            Button(action: {
                openWindow(id: "AboutUI:About")
            }) {
                Text("About \(appName)", bundle: Bundle.module)
            }
        }
    }
}
#endif
