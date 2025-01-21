//
//  ColorRectangle.swift
//  MixColor
//
//  Created by Дмитрий on 20.01.2025.
//

import SwiftUI

enum ColorRectangleSizes: CGFloat {
    case s = 60
    case m = 70
    case l = 80
    case xl = 90
    case xxl = 100
}

struct ColorRectangleView: View {
    
    var size: ColorRectangleSizes = .s
    var text = "Black"
    var color = Color(.black)
    
    var fontSize: CGFloat {
        switch size {
        case .s: return 15
        case .m: return 17
        case .l: return 19
        case .xl: return 21
        case .xxl: return 23
        }
    }
    
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: fontSize))
            Rectangle()
                .fill(color)
                .frame(width: size.rawValue, height: size.rawValue)
                .border(Color.black, width: color == Color.white ? 1 : 0)
        }
    }
}

#Preview {
    ColorRectangleView(size: .l)
}
