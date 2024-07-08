//
//  QuestsEndpoint.swift
//  Questios
//
//  Created by David Gunawan on 05/07/24.
//
import Foundation

enum QuestsEndpoint {
    case quests
    case questDetail(id: String)
}

extension QuestsEndpoint: Endpoint {
    var path: String {
        switch self {
        case .quests, .questDetail:
            return "/rest/v1/Quest"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .quests, .questDetail:
            return .get
        }
    }
    
    var header: [String: String]? {
        return [
            "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhpdG15aHp0ZWllc2d6cGVqaWlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNzg4NTEsImV4cCI6MjAzMzY1NDg1MX0.pHw-nfKycex3VlWDo8GM8LjpeBMjOVLJK_14Ye5KhtE",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhpdG15aHp0ZWllc2d6cGVqaWlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNzg4NTEsImV4cCI6MjAzMzY1NDg1MX0.pHw-nfKycex3VlWDo8GM8LjpeBMjOVLJK_14Ye5KhtE"
        ]
    }
    
    var body: [String: String]? {
        switch self {
        case .quests, .questDetail:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .quests:
            return [URLQueryItem(name: "select", value: "*")]
        case .questDetail(let id):
            return [
                URLQueryItem(name: "id", value: "eq.\(id)"),
                URLQueryItem(name: "select", value: "*")
            ]
        }
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
}
