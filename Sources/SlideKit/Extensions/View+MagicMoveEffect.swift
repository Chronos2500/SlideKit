//
//  View+MagicMoveEffect.swift
//  SlideKit
//
//  Created by Chronos2500 on 2026/03/05.
//

import SwiftUI

struct MagicMoveEffectModifier<ID>: ViewModifier where ID: Hashable {
    @Environment(\.presentationNamespace) var namespace
    let id: ID

    func body(content: Content) -> some View {
        content
            .matchedGeometryEffect(id: id, in: namespace)
    }
}

extension View {
    /// Associates this view with a magic move transition using the specified identifier.
    /// 
    /// Views that share the same identifier participate in the same transition,
    /// allowing their position and layout to animate smoothly between states.
    /// 
    /// When animating views containing ``Text``, enabling `fixedSize` is recommended
    /// to preserve the intrinsic size of the text during the transition.
    /// 
    /// - Parameters:
    ///   - id: A stable identifier that links views participating in the same transition.
    ///   - fixedSize: A Boolean value that determines whether the view keeps its intrinsic
    ///     size during layout. Enabling this is recommended when the view contains `Text`.
    /// 
    /// - Returns: A view configured to participate in a magic move transition.
    public func magicMoveEffect<ID>(
        id: ID,
        fixedSize: Bool = false
    ) -> some View where ID: Hashable {
        self
            .fixedSize(horizontal: fixedSize, vertical: fixedSize)
            .modifier(
                MagicMoveEffectModifier(id: id)
            )
    }
}
