//
//  NotionResponse.swift
//  Questios
//
//  Created by David Gunawan on 29/05/24.
//

import Foundation

struct Quest: Codable {
    let object: String
    let results: [Page]
    let nextCursor: String?
    let hasMore: Bool
    let type: String
    let pageOrDatabase: [String: String]
    let developerSurvey: String
    let requestId: String
    
    enum CodingKeys: String, CodingKey {
        case object, results
        case nextCursor = "next_cursor"
        case hasMore = "has_more"
        case type
        case pageOrDatabase = "page_or_database"
        case developerSurvey = "developer_survey"
        case requestId = "request_id"
    }
}

struct Page: Codable {
    let object: String
    let id: String
    let createdTime: String
    let lastEditedTime: String
    let createdBy: User
    let lastEditedBy: User
    let cover: Cover
    let icon: Icon
    let parent: Parent
    let archived: Bool
    let inTrash: Bool
    let properties: Properties
    let url: String
    let publicUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case object, id
        case createdTime = "created_time"
        case lastEditedTime = "last_edited_time"
        case createdBy = "created_by"
        case lastEditedBy = "last_edited_by"
        case cover, icon, parent, archived
        case inTrash = "in_trash"
        case properties, url
        case publicUrl = "public_url"
    }
}

struct User: Codable {
    let object: String
    let id: String
}

struct Cover: Codable {
    let type: String
    let external: External
}

struct External: Codable {
    let url: String
}

struct Icon: Codable {
    let type: String
    let emoji: String
}

struct Parent: Codable {
    let type: String
    let databaseId: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case databaseId = "database_id"
    }
}

struct Properties: Codable {
    let priority: Property
    let name: Property
    
    enum CodingKeys: String, CodingKey {
        case priority = "Priority"
        case name = "Name"
    }
}

struct Property: Codable {
    let id: String
    let type: String
    let select: Select?
    let title: [Title]?
}

struct Select: Codable {
    let id: String
    let name: String
    let color: String
}

struct Title: Codable {
    let type: String
    let text: TextResponse
    let annotations: Annotations
    let plainText: String
    let href: String?
    
    enum CodingKeys: String, CodingKey {
        case type, text, annotations
        case plainText = "plain_text"
        case href
    }
}

struct TextResponse: Codable {
    let content: String
    let link: String?
}

struct Annotations: Codable {
    let bold: Bool
    let italic: Bool
    let strikethrough: Bool
    let underline: Bool
    let code: Bool
    let color: String
}
