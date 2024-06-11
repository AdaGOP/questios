//
//  APIService.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import Foundation

class QuestAPIService: APIServiceProtocol {
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
        try handleResponse(data: data, response: response)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        do {
            let quests = try decoder.decode([Quest].self, from: data)
            return quests
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    func getQuestDetails(questId: String) async throws -> Quest {
        let (data, response) = try await data(from: Endpoint.questDetails(id: questId).url)
        try handleResponse(data: data, response: response)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        do {
            let questDetails = try decoder.decode(Quest.self, from: data)
            return questDetails
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    private func handleResponse(data: Data, response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        let statusCode = HTTPStatusCode(rawValue: httpResponse.statusCode) ?? .unknown
        
        switch statusCode {
        case .ok:
            return
        default:
            throw APIError.httpError(statusCode)
        }
    }
}
