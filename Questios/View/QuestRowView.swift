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
            .frame(width: 200, height: 120)
            .clipShape(.rect(cornerRadius: 8))
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(quest.title)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Text(quest.level)
                        .font(.system(size: 15))
                        .lineLimit(2)
                        .foregroundColor(.red)
                    Text(quest.prize)
                        .font(.system(size: 15))
                        .lineLimit(2)
                        .foregroundColor(.green)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    QuestRowView(quest: Quest(id: "12312", title: "Finding Nemo", url: "https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb", level: "Medium", prize: "3"))
}
