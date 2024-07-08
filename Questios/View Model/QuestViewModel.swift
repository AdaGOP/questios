//
//  QuestViewModel.swift
//  Questios
//
//  Created by David Gunawan on 29/05/24.
//

import Foundation

class QuestViewModel: ObservableObject {
    private let apiService: QuestServiceable
    @Published var quests: [Quest] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(apiService: QuestServiceable = QuestService()) {
        self.apiService = apiService
    }
    
    @MainActor
    func fetchQuests() async {
        isLoading = true
        errorMessage = nil
        
        let result = await apiService.getQuests()
        
        switch result {
        case .success(let fetchedQuests):
            quests = fetchedQuests
        case .failure(let error):
            errorMessage = error.customMessage
        }
        
        isLoading = false
    }
}
