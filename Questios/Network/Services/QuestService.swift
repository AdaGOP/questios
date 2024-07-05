//
//  QuestService.swift
//  Questios
//
//  Created by David Gunawan on 05/07/24.
//

import Foundation


protocol QuestServiceable {
    func getQuests() async -> Result<[Quest], RequestError>
    func getQuestDetail(id: String) async -> Result<[Quest], RequestError>
}

struct QuestService: HTTPClient, QuestServiceable {
    func getQuests() async -> Result<[Quest], RequestError> {
        return await sendRequest(endpoint: QuestsEndpoint.quests, responseModel: [Quest].self)
    }
    
    func getQuestDetail(id: String) async -> Result<[Quest], RequestError> {
        return await sendRequest(endpoint: QuestsEndpoint.questDetail(id: id), responseModel: [Quest].self)
    }
}
