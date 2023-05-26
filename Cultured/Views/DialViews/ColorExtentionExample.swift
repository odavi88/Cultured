//
//  ColorExtentionExample.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/23/23.
//

import SwiftUI

/// Creating color extensions to plug in custom colors for the rings.
extension Color {
    public static var outlineRed: Color {
        return Color(decimalRed: 34, green: 0, blue: 3)
    }
    
    // Base Circle Color
    public static var darkRed: Color {
        return Color(decimalRed: 221, green: 31, blue: 59)
    }
    
    // Progress Circle Color
    public static var lightRed: Color {
        return Color(decimalRed: 239, green: 54, blue: 128)
    }
    
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
}
