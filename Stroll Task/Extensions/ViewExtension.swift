//
//  ViewExtension.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 24/06/25.
//


import SwiftUI

struct ScalableFontSizeModifier: ViewModifier {
    let weight: ProximaNovaWeight
    let size: CGFloat
    let baseHeight: CGFloat
    let baseWidth: CGFloat
    
    func body(content: Content) -> some View {
        let screenSize = UIScreen.main.bounds.size
        let scaleW = screenSize.width / baseWidth
        let scaleH = screenSize.height / baseHeight
        let scale = sqrt(scaleW * scaleH)
        return content
            .font(.proximaNova(weight, size: size * scale))
    }
}

struct ScalableViewFrameModifier: ViewModifier {
    let height: CGFloat?
    let width: CGFloat?
    let baseHeight: CGFloat
    let baseWidth: CGFloat
    
    func body(content: Content) -> some View {
        let screenSize = UIScreen.main.bounds.size
        let scaleW = screenSize.width / baseWidth
        let scaleH = screenSize.height / baseHeight
        
        return content
            .frame(width: width != nil ? width! * scaleW : nil,
                   height: height != nil ? height! * scaleH : nil)
    }
}

struct ScalablePaddingModifier: ViewModifier {
    let edges: Edge.Set
    let basePadding: CGFloat
    let baseWidth: CGFloat
    let baseHeight: CGFloat

    func body(content: Content) -> some View {
        let screen = UIScreen.main.bounds
        let scale: CGFloat

        if edges == .horizontal {
            scale = screen.width / baseWidth
        } else if edges == .vertical {
            scale = screen.height / baseHeight
        } else {
            let scaleW = screen.width / baseWidth
            let scaleH = screen.height / baseHeight
            scale = sqrt(scaleW * scaleH)
        }

        return content.padding(edges, basePadding * scale)
    }
}

extension View {
    func scalableFontSize(weight: ProximaNovaWeight = .regular, size: CGFloat, baseHeight: CGFloat = 852, baseWidth: CGFloat = 393) -> some View {
        self.modifier(ScalableFontSizeModifier(weight: weight, size: size, baseHeight: baseHeight, baseWidth: baseWidth))
    }
    
    func scalableFrame(height: CGFloat? = nil, width: CGFloat? = nil, baseHeight: CGFloat = 852, baseWidth: CGFloat = 393) -> some View {
        self.modifier(ScalableViewFrameModifier(height: height, width: width, baseHeight: baseHeight, baseWidth: baseWidth))
    }
    
    func scalablePadding(
        _ edges: Edge.Set = .all,
        _ base: CGFloat,
        baseWidth: CGFloat = 393,
        baseHeight: CGFloat = 852
    ) -> some View {
        self.modifier(
            ScalablePaddingModifier(
                edges: edges,
                basePadding: base,
                baseWidth: baseWidth,
                baseHeight: baseHeight
            )
        )
    }
}
