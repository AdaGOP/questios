//
//  APIService.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import Foundation

class APIService: APIServiceProtocol {
    func fetchQuests() async throws -> [Quest] {
        try await URLSession.shared.fetchQuests()
    }
    
    func getQuestDetails(questId: String) async throws -> Quest {
        try await URLSession.shared.getQuestDetails(questId: questId)
    }
}

// MARK: - URLSession Extension
extension URLSession {
    func fetchQuests() async throws -> [Quest] {
        let (data, response) = try await data(from: Endpoint.quests.url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIErrorResponse(message: "Invalid response", statusCode: 0)
        }
        
        guard httpResponse.statusCode == 200 else {
            throw APIErrorResponse(message: "Failed to fetch quests", statusCode: httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let quests = try decoder.decode([Quest].self, from: data)
        return quests
    }
    
    func getQuestDetails(questId: String) async throws -> Quest {
        let (data, response) = try await data(from: Endpoint.questDetails(id: questId).url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIErrorResponse(message: "Invalid response", statusCode: 0)
        }
        
        guard httpResponse.statusCode == 200 else {
            throw APIErrorResponse(message: "Failed to fetch quest details", statusCode: httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let questDetails = try decoder.decode(Quest.self, from: data)
        return questDetails
    }
}
