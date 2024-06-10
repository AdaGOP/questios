//
//  APIService.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import Foundation

class APIService: APIServiceProtocol {
    func fetchQuests() async throws -> [Quest] {
        try await loadQuestsFromFile()
    }
    
    func getQuestDetails(questId: String) async throws -> Quest {
        try await loadQuestDetailsFromFile(questId: questId)
    }
    
    private func loadQuestsFromFile() async throws -> [Quest] {
        guard let url = Bundle.main.url(forResource: "DummyData", withExtension: "json") else {
            throw APIError.invalidResponse
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let quests = try decoder.decode([Quest].self, from: data)
            return quests
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    private func loadQuestDetailsFromFile(questId: String) async throws -> Quest {
        guard let url = Bundle.main.url(forResource: "DummyData", withExtension: "json") else {
            throw APIError.invalidResponse
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let quests = try decoder.decode([Quest].self, from: data)
            
            if let questDetails = quests.first(where: { $0.id == questId }) {
                return questDetails
            } else {
                throw APIError.invalidResponse
            }
        } catch {
            throw APIError.decodingError(error)
        }
    }
}


