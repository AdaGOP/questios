//
//  DifficultyView.swift
//  Questios
//
//  Created by David Gunawan on 05/06/24.
//

import SwiftUI

struct DifficultyView: View {
    let level: String
    
    var body: some View {
        HStack(spacing: 2) {
            let swords = String(repeating: "⚔", count: difficultyStars())
            Text("Difficulty: \(swords)")
                .foregroundColor(.red)
        }
    }
    
    private func difficultyStars() -> Int {
        switch level {
        case "Easy":
            return 1
        case "Medium":
            return 2
        case "Hard":
            return 3
        default:
            return 0
        }
    }
}
