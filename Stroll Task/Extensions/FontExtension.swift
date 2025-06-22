//
//  FontExtension.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//


import SwiftUI

extension Font {
    static func poppins(_ weight: PoppinsWeight, size: CGFloat) -> Font {
        return .custom(weight.rawValue, size: size)
    }

    static func proximaNova(_ weight: ProximaNovaWeight, size: CGFloat) -> Font {
        return .custom(weight.rawValue, size: size)
    }
}

enum ProximaNovaWeight: String {
    case black = "ProximaNova-Black"
    case bold = "ProximaNova-Bold"
    case extraBold = "ProximaNova-ExtraBold"
    case light = "ProximaNova-Light"
    case regular = "ProximaNova-Regular"
    case semiBold = "ProximaNova-SemiBold"
    case thin = "ProximaNova-Thin"
    case regularItalic = "ProximaNova-RegularItalic"
}

enum PoppinsWeight: String {
    case thin = "Poppins-Thin"
    case thinItalic = "Poppins-ThinItalic"
    case extraLight = "Poppins-ExtraLight"
    case extraLightItalic = "Poppins-ExtraLightItalic"
    case light = "Poppins-Light"
    case lightItalic = "Poppins-LightItalic"
    case regular = "Poppins-Regular"
    case italic = "Poppins-Italic"
    case medium = "Poppins-Medium"
    case mediumItalic = "Poppins-MediumItalic"
    case semiBold = "Poppins-SemiBold"
    case semiBoldItalic = "Poppins-SemiBoldItalic"
    case bold = "Poppins-Bold"
    case boldItalic = "Poppins-BoldItalic"
    case extraBold = "Poppins-ExtraBold"
    case extraBoldItalic = "Poppins-ExtraBoldItalic"
    case black = "Poppins-Black"
    case blackItalic = "Poppins-BlackItalic"
}
