//
//  ItemView.swift
//  Questios
//
//  Created by David Gunawan on 29/05/24.
//

import SwiftUI

struct QuestRowView: View {
    let quest: Quest
    
    init(quest: Quest) {
        self.quest = quest
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            AsyncImage(url: URL(string: quest.url)) { phase in
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
            .id(quest.id)
            .frame(width: .infinity, height: 200)
            .clipShape(.rect(cornerRadius: 8))
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(quest.title)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    DifficultyView(level: quest.level)
                    PrizeView(prize: quest.prize)
                }
                Spacer()
            }
        }
    }
}


#Preview {
    QuestRowView(quest: Quest(id: "12312", title: "Finding Nemo", url: "https://images.unsplash.com/photo-1545173168-9f1947eebb7f?q=80&w=3353&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", level: "Medium", prize: "3"))
}
