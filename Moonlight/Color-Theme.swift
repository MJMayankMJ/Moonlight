//
//  Color-Theme.swift
//  Moonlight
//
//  Created by Mayank Jangid on 10/5/24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(#colorLiteral(red: 0.224, green: 0.333, blue: 0.333, alpha: 1)) // #395555
        //Color(#colorLiteral(red: 0.6, green: 0.722, blue: 0.78, alpha: 1)) // #99b8c7
    }
    static var lightBackground: Color {
        //Color(#colorLiteral(red: 0.137, green: 0.835, blue: 0.835, alpha: 1)) // #23d5d5
        //Color(#colorLiteral(red: 0.561, green: 0.851, blue: 0.984, alpha: 1)) // #8fd9fb
        Color(#colorLiteral(red: 0.224, green: 0.667, blue: 0.667, alpha: 1)) // #39aaaa
    }
}
