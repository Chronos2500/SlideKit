//
//  EnvironmentValues+presentationNamepace.swift
//  SlideKit
//  
//  Created by Chronos2500 on 2026/02/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry public var presentationNamespace: Namespace.ID = Namespace().wrappedValue
}
