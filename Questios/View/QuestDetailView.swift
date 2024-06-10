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
                VStack(alignment: .leading, spacing: 16.0) {
                    AsyncImage(url: URL(string: questDetails.url)) { phase in
                        switch phase {
                        case .failure:
                            Image(systemName: "photo")
                                .font(.largeTitle)
                        case .success(let image):
                            image
                                .resizable()
                        default:
                            ProgressView()
                        }
                    }
                    .id(questDetails.id)
                    .frame(width: .infinity, height: 200)
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(questDetails.title)
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            DifficultyView(level: questDetails.level)
                            PrizeView(prize: questDetails.prize)
                        }
                        .padding(.horizontal, 16)
                        Spacer()
                    }
                }
                Spacer()
            }  else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .task {
            await viewModel.getQuestDetails(questId: questId)
        }
    }
}

#Preview {
    QuestDetailView(questId: "52a20495-d5d4-4506-bac5-0da06d2373ac")
}
