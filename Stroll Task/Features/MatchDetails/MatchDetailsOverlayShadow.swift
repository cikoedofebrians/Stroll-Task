//
//  MatchDetailsOverlayShadow.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 22/06/25.
//


import SwiftUI

struct MatchDetailsOverlayShadow: View {
    let proxy: GeometryProxy
    
    var body: some View {
        RadialGradient(
            stops: [
                Gradient.Stop(color: .black.opacity(0.0), location: 0),
                Gradient.Stop(color: .black.opacity(0.1), location: 0.3),
                Gradient.Stop(color: .black.opacity(0.5), location: 0.6),
                Gradient.Stop(color: .black, location: 0.72),
            ],
            center: UnitPoint(x: 0.5, y: 0.32),
            startRadius: 0,
            endRadius: proxy.size.width
        )
        .ignoresSafeArea()
        LinearGradient(
            stops: [
                Gradient.Stop(color: .black.opacity(0.27), location: 0.00),
                Gradient.Stop(color: .black.opacity(0.15), location: 0.32),
                Gradient.Stop(color: .black.opacity(0.08), location: 0.45),
                Gradient.Stop(color: .black.opacity(0.05), location: 0.57),
                Gradient.Stop(color: .black.opacity(0), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 0.31)
        )
        .ignoresSafeArea()
        LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.06, green: 0.07, blue: 0.08).opacity(0), location: 0.26),
                Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.08).opacity(0.05), location: 0.47),
                Gradient.Stop(color: Color(red: 0.05, green: 0.06, blue: 0.08).opacity(0.13), location: 0.54),
                Gradient.Stop(color: Color(red: 0.05, green: 0.06, blue: 0.07).opacity(0.16), location: 0.60),
                Gradient.Stop(color: Color(red: 0.05, green: 0.06, blue: 0.07).opacity(0.21), location: 0.61),
                Gradient.Stop(color: Color(red: 0.05, green: 0.06, blue: 0.07).opacity(0.28), location: 0.64),
                Gradient.Stop(color: Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.46), location: 0.67),
                Gradient.Stop(color: Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.5), location: 0.69),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
        )
    }
}
