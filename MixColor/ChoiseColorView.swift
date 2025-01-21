//
//  ChoiseColorView.swift
//  MixColor
//
//  Created by Дмитрий on 21.01.2025.
//

import SwiftUI

struct ChoiseColorView: View {
    
    @Binding var colors: [Color]
    @Binding var colorsName: [String]
    @Binding var selectedIndex: Int
    @Binding var isDetailViewPresented: Bool
    
    // Используется масив кортежей, чтобы обеспечить порядок сортировки
    private let baseColors: [(String, Color)] = [
        ("Red", Color.red),
        ("Blue", Color.blue),
        ("Green", Color.green),
        ("Yellow", Color.yellow),
        ("Orange", Color.orange),
        ("Purple", Color.purple),
        ("White", Color.white),
        ("Black", Color.black),
    ]
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            Section {
                ForEach(baseColors.indices, id: \.self) { i in
                    let element = baseColors[i]
                    ColorRectangleView(
                        size: .m,
                        text: element.0,
                        color: element.1
                    )
                    .onTapGesture {
                        colors[selectedIndex] = element.1
                        colorsName[selectedIndex] = element.0
                        isDetailViewPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var colors = [Color.red, Color.blue, Color.green, Color.green, Color.green, Color.green, Color.green, Color.green]
    @Previewable @State var names = ["1", "2", "3", "4", "5", "6", "7", "8"]
    @Previewable @State var index = 0
    @Previewable @State var isPresented = false
    
    ChoiseColorView(
        colors: $colors,
        colorsName: $names,
        selectedIndex: $index,
        isDetailViewPresented: $isPresented
    )
}
