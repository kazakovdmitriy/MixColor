//
//  ContentView.swift
//  MixColor
//
//  Created by Дмитрий on 20.01.2025.
//

import SwiftUI


struct ContentView: View {
    
    @State private var columnsCount = 2
    @State private var colors: [Color]
    @State private var colorsName: [String]
    @State private var selectedRectangleIndex: Int = 0
    @State private var isDetailViewPresented = false
    
    private let maxColumnsInGrid = 4
    
    init() {
        _colors = State(initialValue: Array(
            repeating: Color.black,
            count: 10)
        )
        _colorsName = State(initialValue: Array(
            repeating: "Black",
            count: 10)
        )
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                RectangleGridView(
                    columnsCount: $columnsCount,
                    colors: $colors,
                    colorsName: $colorsName,
                    selectedRectangleIndex: $selectedRectangleIndex,
                    isDetailViewPresented: $isDetailViewPresented
                )
                
                Spacer()
                
                HStack {
                    Button("-") {
                        if columnsCount > 0 {
                            columnsCount -= 1
                        } else {
                            columnsCount = 0
                        }
                    }
                    .font(.system(size: 20))
                    
                    Text("\(columnsCount)")
                        .font(.system(size: 20))
                    
                    Button("+") {
                        if columnsCount < maxColumnsInGrid {
                            columnsCount += 1
                        }
                    }
                    .font(.system(size: 20))
                }
                .padding()
            }
            .sheet(isPresented: $isDetailViewPresented) {
                NavigationView {
                    ChoiseColorView(colors: $colors,
                                    colorsName: $colorsName,
                                    selectedIndex: $selectedRectangleIndex,
                                    isDetailViewPresented: $isDetailViewPresented
                    )
                }
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    ContentView()
}
