//
//  ItemViewModel.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import Foundation

class ItemViewModel: ObservableObject {
    private let apiService: QuestServiceable
    @Published var questDetails: [Quest] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(apiService: QuestServiceable = QuestService()) {
        self.apiService = apiService
    }
    
    @MainActor
    func getQuestDetails(questId: String) async {
        isLoading = true
        errorMessage = nil
        
        let result = await apiService.getQuestDetail(id: questId)
        
        switch result {
        case .success(let fetchedDetails):
            questDetails = fetchedDetails
        case .failure(let error):
            errorMessage = error.customMessage
        }
        
        isLoading = false
    }
}
