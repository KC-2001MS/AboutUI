//
//  EnvironmentValues.swift
//  AboutUI
//
//  Created by 茅根啓介 on 2024/10/03.
//

import SwiftUI

#if os(macOS)
@available(macOS 15, *)
@available(iOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {
    @Entry var openAbout: OpenAboutAction = OpenAboutAction()
}
#endif
