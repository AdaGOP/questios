//
//  QuestViewModel.swift
//  Questios
//
//  Created by David Gunawan on 29/05/24.
//

import Foundation

class QuestViewModel: ObservableObject {
    private let apiService: APIServiceProtocol
    @Published var quests: [Quest] = []
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    @MainActor
    func fetchQuests() async {
        do {
            quests = try await apiService.fetchQuests()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
