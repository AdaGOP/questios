//
//  Protocols.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import Foundation


protocol APIServiceProtocol {
    func fetchQuests() async throws -> [Quest]
    func getQuestDetails(questId: String) async throws -> Quest
}

// MARK: - Endpoint
enum Endpoint {
    case quests
    case questDetails(id: String)
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 3001
        
        switch self {
        case .quests:
            components.path = "/quests"
        case .questDetails(let id):
            components.path = "/quests/\(id)"
        }
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}
