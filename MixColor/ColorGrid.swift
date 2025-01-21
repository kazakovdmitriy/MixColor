//
//  ColorGrid.swift
//  MixColor
//
//  Created by Дмитрий Казаков on 21.01.2025.
//

import SwiftUI

struct ColorGrid: View {
    
    @Binding var columnsCount: Int
    
    var columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    private var rectangleSize: ColorRectangleSizes {
        switch columnsCount {
        case 1, 2, 3: return .xxl
        case 4: return .m
        case 5, 6: return .s
        case 7: return .s
        default: return .l
        }
    }
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 10){
                Section {
                    ForEach(0..<columnsCount, id: \.self) { i in
                        ColorRectangle(size: rectangleSize)
                        if i < columnsCount-1 {
                            Text("+")
                                .font(.system(size: 20))
                        }
                    }
                }
            }
            
            if columnsCount > 0 {
                Text("=")
                    .font(.system(size: 20))
                ColorRectangle(size: rectangleSize)
            }
        }
        .padding(.top, 30)
    }
}

#Preview {
    @Previewable @State var value = 2
    ColorGrid(columnsCount: $value)
}
