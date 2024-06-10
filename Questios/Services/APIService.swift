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
        guard let url = Bundle.main.url(forResource: "Locate the JSON HERE", withExtension: "Extension of the file here") else {
            throw APIError.invalidResponse
        }
        
        do {
            // This code is totally incorrect, you need to decode the data from JSON properly and change the quest's value.
            let quests = try! [Quest(from: Quest.self as! Decoder)]
            return quests
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    private func loadQuestDetailsFromFile(questId: String) async throws -> Quest {
        guard let url = Bundle.main.url(forResource: "Locate the JSON HERE", withExtension: "Extension of the file here") else {
            throw APIError.invalidResponse
        }
        
        do {
            // This code is totally incorrect, you need to decode the data from JSON properly and change the quest's value.
            let quests = try! Quest(from: Quest.self as! Decoder)
            return quests
        } catch {
            throw APIError.decodingError(error)
        }
    }
}


