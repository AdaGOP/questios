//
//  PrizeView.swift
//  Questios
//
//  Created by David Gunawan on 05/06/24.
//

import SwiftUI

struct PrizeView: View {
    let prize: String
    
    var body: some View {
        HStack(spacing: 2) {
            let stars = String(repeating: "⭐️", count: Int(prize) ?? 0)
            Text("Reward: \(stars)")
                .foregroundColor(.green)
        }
    }
}
