//
//  ColorRectangle.swift
//  MixColor
//
//  Created by Дмитрий on 20.01.2025.
//

import SwiftUI

struct ColorRectangle: View {
    
    var size: CGFloat = 80
    var text = "Black"
    var color = Color(.black)
    
    var body: some View {
        VStack {
            Text(text)
            Rectangle()
                .fill(color)
                .frame(width: size, height: size)
        }
    }
}

#Preview {
    ColorRectangle(size: 80)
}
