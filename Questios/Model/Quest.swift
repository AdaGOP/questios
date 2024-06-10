//
//  NotionResponse.swift
//  Questios
//
//  Created by David Gunawan on 29/05/24.
//

import Foundation

struct Quest: Identifiable, Codable {
    let id: String
    let title: String
    let url: String
    let level: String
    let prize: String
}   


