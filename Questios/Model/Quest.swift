//
//  NotionResponse.swift
//  Questios
//
//  Created by David Gunawan on 29/05/24.
//

import Foundation

struct Quest: Identifiable, Decodable {
    let id: String
    let title: String
    let url: String
    let level: String
    let prize: String
}   


extension Quest {
    static func fake() -> Self {
        return Quest(id: "1", title: "", url: "asda", level: "1", prize: "5")
    }
}
