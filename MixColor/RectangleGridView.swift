//
//  ColorGrid.swift
//  MixColor
//
//  Created by Дмитрий Казаков on 21.01.2025.
//

import SwiftUI

struct RectangleGridView: View {
    
    @Binding var columnsCount: Int
    @Binding var colors: [Color]
    @Binding var colorsName: [String]
    @Binding var selectedRectangleIndex: Int
    @Binding var isDetailViewPresented: Bool
    
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
                        ColorRectangleView(
                            size: rectangleSize,
                            text: colorsName[i],
                            color: colors[i])
                            .onTapGesture {
                                selectedRectangleIndex = i
                                isDetailViewPresented = true
                            }
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
                ColorRectangleView(size: rectangleSize)
            }
        }
        .padding(.top, 30)
    }
}

#Preview {
    @Previewable @State var value = 2
    @Previewable @State var colors = [Color.red, Color.blue, Color.green]
    @Previewable @State var colorsName = ["red", "green", "blue"]
    @Previewable @State var selectedRectangleIndex: Int = 0
    @Previewable @State var isDetailViewPresented: Bool = false
    
    RectangleGridView(columnsCount: $value,
                      colors: $colors,
                      colorsName: $colorsName,
                      selectedRectangleIndex: $selectedRectangleIndex,
                      isDetailViewPresented: $isDetailViewPresented)
}
