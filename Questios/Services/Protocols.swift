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

// **MARK: - Request Protocol**
protocol RequestProtocol {
    func makeRequest(to url: URL, with headers: [String: String]) async throws -> (Data, URLResponse)
}

extension URLSession: RequestProtocol {
    func makeRequest(to url: URL, with headers: [String: String]) async throws -> (Data, URLResponse) {
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        return try await data(for: request)
    }
}

// MARK: - Endpoint
enum Endpoint {
    case quests
    case questDetails(id: String)
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "hitmyhzteiesgzpejiip.supabase.co"
        components.path = "/rest/v1/Quest"
        
        switch self {
        case .quests:
            components.queryItems = [
                URLQueryItem(name: "select", value: "*")
            ]
        case .questDetails(let id):
            components.queryItems = [
                URLQueryItem(name: "id", value: "eq.\(id)"),
                URLQueryItem(name: "select", value: "*")
            ]
        }
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: String] {
        return [
            "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhpdG15aHp0ZWllc2d6cGVqaWlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNzg4NTEsImV4cCI6MjAzMzY1NDg1MX0.pHw-nfKycex3VlWDo8GM8LjpeBMjOVLJK_14Ye5KhtE",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhpdG15aHp0ZWllc2d6cGVqaWlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNzg4NTEsImV4cCI6MjAzMzY1NDg1MX0.pHw-nfKycex3VlWDo8GM8LjpeBMjOVLJK_14Ye5KhtE"
        ]
    }
}


// MARK: - API Error
enum APIError: Error {
    case invalidResponse
    case httpError(HTTPStatusCode)
    case decodingError(Error)
}

enum HTTPStatusCode: Int {
    case ok = 200
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
    case unknown
}
