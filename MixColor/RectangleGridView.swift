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
    
    private let mixRules: [Set<String>: [String: Color]] = [
        // Два цвета
        ["Blue", "Red"]: [
            "Purple": Color.purple
        ],
        ["Red", "Yellow"]: [
            "Orange": Color.orange
        ],
        ["Blue", "Yellow"]: [
            "Green": Color.green
        ],
        ["Green", "Red"]: [
            "Brown": Color(red: 0.5, green: 0.25, blue: 0.0)
        ],
        ["Blue", "Green"]: [
            "Cyan": Color.cyan
        ],
        ["Red", "White"]: [
            "Pink": Color.pink
        ],
        ["Black", "White"]: [
            "Gray": Color.gray
        ],
        ["Black", "Yellow"]: [
            "Dark Yellow": Color(red: 0.5, green: 0.5, blue: 0.0)
        ],
        
        // Три цвета
        ["Blue", "Green", "Red"]: [
            "Gray": Color.gray
        ],
        ["Blue", "Red", "Yellow"]: [
            "Brown": Color(red: 0.6, green: 0.4, blue: 0.2)
        ],
        ["Blue", "Red", "White"]: [
            "Lavender": Color(red: 0.8, green: 0.6, blue: 0.9)
        ],
        ["Blue", "White", "Yellow"]: [
            "Sky Blue": Color(red: 0.7, green: 0.9, blue: 0.9)
        ],
        ["Black", "Red", "Yellow"]: [
            "Dark Orange": Color(red: 0.5, green: 0.25, blue: 0.0)
        ],
        ["Blue", "Green", "White"]: [
            "Aqua": Color(red: 0.5, green: 0.75, blue: 0.75)
        ],
        
        // Четыре цвета
        ["Blue", "Green", "Red", "Yellow"]: [
            "Dark Brown": Color(red: 0.4, green: 0.3, blue: 0.2)
        ],
        ["Blue", "Red", "Yellow", "White"]: [
            "Pale Brown": Color(red: 0.65, green: 0.5, blue: 0.4)
        ],
        ["Black", "Green", "Red", "White"]: [
            "Muted Gray": Color(red: 0.5, green: 0.4, blue: 0.4)
        ],
        ["Blue", "Green", "White", "Yellow"]: [
            "Bright Teal": Color(red: 0.6, green: 0.8, blue: 0.7)
        ],
        ["Black", "Red", "Blue", "White"]: [
            "Dusty Purple": Color(red: 0.4, green: 0.2, blue: 0.3)
        ],
        ["Black", "Green", "Red", "Yellow"]: [
            "Olive Brown": Color(red: 0.5, green: 0.4, blue: 0.2)
        ],
        ["Blue", "Cyan", "Red", "White"]: [
            "Light Lavender": Color(red: 0.7, green: 0.6, blue: 0.9)
        ]
    ]
    
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
