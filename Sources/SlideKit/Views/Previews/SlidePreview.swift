//
//  SlidePreview.swift
//  
//
//  Created by Junnosuke Matsumoto on 2022/08/25.
//

import SwiftUI

public struct SlidePreview: View {

    @ObservedObject
    private var slideIndexController: SlideIndexController

    @Environment(\.previewPrimaryColor)
    private var primaryColor: Color

    @Environment(\.previewSecondaryColor)
    private var secondaryColor: Color

    @Environment(\.previewBackgroundColor)
    private var backgroundColor: Color

    private let slideSize: CGSize

    public init(slideSize: CGSize = SlideSize.standard16_9, index: Int = 0, @SlideBuilder  _ content: () -> [any Slide]) {
        self.slideSize = slideSize
        slideIndexController = SlideIndexController(index: index, slideBuilder: content)
    }

    public var body: some View {
        PresentationView(slideSize: slideSize) {
            SlideRouterView(slideIndexController: slideIndexController)
                .background(backgroundColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .foregroundStyle(primaryColor, secondaryColor)
        }
        .aspectRatio(slideSize, contentMode: .fit)
    }

    public func previewColor(primary: Color = .black, secondary: Color = .secondary, background: Color = .white) -> some View {
        self.environment(\.previewBackgroundColor, background)
            .environment(\.previewPrimaryColor, primary)
            .environment(\.previewSecondaryColor, secondary)
    }
}

extension EnvironmentValues {
    @Entry fileprivate var previewBackgroundColor: Color = .white
}

extension EnvironmentValues {
    @Entry fileprivate var previewPrimaryColor: Color = .black
}

extension EnvironmentValues {
    @Entry fileprivate var previewSecondaryColor: Color = .secondary
}
