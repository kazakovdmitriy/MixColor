//
//  ContentView.swift
//  MixColor
//
//  Created by Дмитрий on 20.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var color1 = Color(red: 0.0, green: 1.0, blue: 0.0)
    @State private var color2 = Color(red: 0.0, green: 0.0, blue: 1.0)
    
    private var mixColor: Color {
        Color.mix(color1, color2)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ColorRectangle(
                    size: 80,
                    text: color1.getColorName(),
                    color: color1
                )
                .padding()
                
                Text("+")
                    .font(.system(size: 30))
                
                ColorRectangle(
                    size: 80,
                    text: color2.getColorName(),
                    color: color2
                )
                .padding()
                
                Text("=")
                    .font(.system(size: 30))
                
                ColorRectangle(
                    size: 80,
                    text: mixColor.getColorName(),
                    color: mixColor
                )
                .padding()
            }
            .navigationTitle("Color Mixer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
