//
//  ItemViewModel.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import Foundation

class ItemViewModel: ObservableObject {
    private let apiService: APIServiceProtocol
    @Published var questDetails: Quest?
    
    init(apiService: APIServiceProtocol = QuestAPIService()) {
        self.apiService = apiService
    }
    
    @MainActor
    func getQuestDetails(questId: String) async {
        do {
            questDetails = try await apiService.getQuestDetails(questId: questId)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
