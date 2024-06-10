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
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    @MainActor
    func getQuestDetails(questId: String) async {
        do {
            
            // Fix the getQuestDetails function first, then call it from here accordingly.
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
