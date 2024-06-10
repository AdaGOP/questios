//
//  Protocols.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import Foundation

// MARK: - API Service Protocol
protocol APIServiceProtocol {
    func fetchQuests() async throws -> [Quest]
    func getQuestDetails(questId: String) async throws -> Quest
}

// MARK: - Endpoint for later configuration

// MARK: - API Error
enum APIError: Error {
    case invalidResponse
    case decodingError(Error)
}


// MARK: ENUM STATUS ERROR CODE
