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
                    // You need to add something here to navigate to the page detail from here.
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
                //Use this space to handle empty state
            }
        }
    }
}


#Preview {
    QuestView()
}
