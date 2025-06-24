//
//  ScalableVStack.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 24/06/25.
//
import SwiftUI

struct ScalableVStack<Content: View>: View {
    let spacing: CGFloat
    let baseHeight: CGFloat
    let content: () -> Content

    init(
        spacing: CGFloat = 8,
        baseHeight: CGFloat = 852,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.spacing = spacing
        self.baseHeight = baseHeight
        self.content = content
    }

    var body: some View {
        let scale = UIScreen.main.bounds.height / baseHeight
        VStack(spacing: spacing * scale) {
            content()
        }
    }
}
