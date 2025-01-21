//
//  ContentView.swift
//  MixColor
//
//  Created by Дмитрий on 20.01.2025.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            Text("DetailView")
                .font(.largeTitle)
                .padding()
            // Здесь можно добавить больше контента для детального представления
        }
        .navigationTitle("Detail") // Добавление заголовка для навигации
    }
}

struct ContentView: View {
    
    @State private var columnsCount = 2
    @State private var isDetailViewPresented = false // Состояние для управления отображением модального окна
    
    private let maxColumnsInGrid = 4
    
    var body: some View {
        NavigationStack {
            VStack {
                ColorGrid(columnsCount: $columnsCount)
                
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
                
                // Кнопка для открытия модального окна
                Button("Open Detail") {
                    isDetailViewPresented = true
                }
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .sheet(isPresented: $isDetailViewPresented) {
                NavigationView {
                    DetailView()
                        .navigationBarItems(trailing: Button("Готово") {
                            isDetailViewPresented = false
                        })
                }
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    ContentView()
}
