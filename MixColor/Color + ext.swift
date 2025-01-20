//
//  Color + ext.swift
//  MixColor
//
//  Created by Дмитрий on 20.01.2025.
//

import SwiftUI

extension Color {
    static func mix(_ color1: Color, _ color2: Color) -> Color {
        let components1 = UIColor(color1).cgColor.components ?? [0, 0, 0, 1]
        let components2 = UIColor(color2).cgColor.components ?? [0, 0, 0, 1]
        
        let r = min(components1[0] + components2[0], 1.0)
        let g = min(components1[1] + components2[1], 1.0)
        let b = min(components1[2] + components2[2], 1.0)
        let a = (components1[3] + components2[3]) / 2
        
        return Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
    
    private func euclideanDistance(from color: Color) -> Double {
        let components1 = UIColor(self).cgColor.components ?? [0, 0, 0, 1]
        let components2 = UIColor(color).cgColor.components ?? [0, 0, 0, 1]
        
        let r1 = components1[0], g1 = components1[1], b1 = components1[2]
        let r2 = components2[0], g2 = components2[1], b2 = components2[2]
        
        return sqrt(pow(r2 - r1, 2) + pow(g2 - g1, 2) + pow(b2 - b1, 2))
    }
    
    func getColorName() -> String {
        let colorNames: [String: Color] = [
            "Red": Color(red: 1.0, green: 0.0, blue: 0.0),
            "Green": Color(red: 0.0, green: 1.0, blue: 0.0),
            "Blue": Color(red: 0.0, green: 0.0, blue: 1.0),
            "Yellow": Color(red: 1.0, green: 1.0, blue: 0.0),
            "Cyan": Color(red: 0.0, green: 1.0, blue: 1.0),
            "Purple": Color(red: 1.0, green: 0.0, blue: 1.0),
            "White": Color(red: 1.0, green: 1.0, blue: 1.0)
        ]
        
        var closestColorName = "Unknown"
        var minDistance = Double.greatestFiniteMagnitude
        
        for (name, color) in colorNames {
            let distance = self.euclideanDistance(from: color)
            
            if distance < minDistance {
                minDistance = distance
                closestColorName = name
            }
        }
        
        let threshold: Double = 0.1
        if minDistance > threshold {
            return "Unknown"
        }
        
        return closestColorName
    }
}

