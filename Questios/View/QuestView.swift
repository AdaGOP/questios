//
//  ContentView.swift
//  Questios
//
//  Created by David Gunawan on 29/05/24.
//

import SwiftUI

struct QuestView: View {
    @StateObject private var model = QuestViewModel()
    
    var body: some View {
        NavigationStack {
            List(model.quests) { quest in
                ZStack {
                    QuestRowView(quest: quest)
                    NavigationLink(destination: QuestDetailView(questId: quest.id)) {
                        EmptyView()
                    }
                    .opacity(0)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Quests")
            .task {
                await model.fetchQuests()
            }
            .padding()
            .overlay {
                if model.quests.isEmpty {
                    /// In case there aren't any search results, we can
                    /// show the new content unavailable view.
                    ContentUnavailableView(
                        "We couldn't fetch the data",
                        systemImage: "icloud.and.arrow.down",
                        description: Text("Please try again later")
                    )
                }
            }
        }
    }
}


#Preview {
    QuestView()
}
