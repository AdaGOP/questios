//
//  Endpoint.swift
//  Questios
//
//  Created by David Gunawan on 05/07/24.
//

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "hitmyhzteiesgzpejiip.supabase.co"
    }
    
    var headers: [String: String] {
        return [
            "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhpdG15aHp0ZWllc2d6cGVqaWlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNzg4NTEsImV4cCI6MjAzMzY1NDg1MX0.pHw-nfKycex3VlWDo8GM8LjpeBMjOVLJK_14Ye5KhtE",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhpdG15aHp0ZWllc2d6cGVqaWlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNzg4NTEsImV4cCI6MjAzMzY1NDg1MX0.pHw-nfKycex3VlWDo8GM8LjpeBMjOVLJK_14Ye5KhtE"
        ]
    }
}
