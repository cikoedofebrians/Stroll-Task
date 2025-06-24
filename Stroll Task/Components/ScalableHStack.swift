//
//  ScalableHStack.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 24/06/25.
//
import SwiftUI

struct ScalableHStack<Content: View>: View {
    let spacing: CGFloat
    let baseWidth: CGFloat
    let content: () -> Content

    init(
        spacing: CGFloat = 8,
        baseWidth: CGFloat = 393,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.spacing = spacing
        self.baseWidth = baseWidth
        self.content = content
    }

    var body: some View {
        let scale = UIScreen.main.bounds.width / baseWidth
        HStack(spacing: spacing * scale) {
            content()
        }
    }
}


