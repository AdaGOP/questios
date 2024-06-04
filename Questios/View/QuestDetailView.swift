//
//  QuestDetailView.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import SwiftUI

struct QuestDetailView: View {
    @StateObject private var viewModel = ItemViewModel()
    let questId: String
    
    var body: some View {
        Group{
            if let questDetails = viewModel.questDetails {
                VStack {
                    Text(questDetails.title)
                    Text("Level: \(questDetails.level)")
                    Text("Prize: \(questDetails.prize)")
                }
            } else {
                ContentUnavailableView(
                    "We couldn't fetch quest detail",
                    systemImage: "icloud.and.arrow.down",
                    description: Text("Please try again later")
                )
            }
        }
        .onAppear {
            Task {
                await viewModel.getQuestDetails(questId: questId)
            }
        }
    }
}
