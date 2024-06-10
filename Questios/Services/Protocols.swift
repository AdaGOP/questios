//
//  Protocols.swift
//  Questios
//
//  Created by David Gunawan on 03/06/24.
//

import Foundation

// MARK: - API Service Protocol
protocol APIServiceProtocol {
    // Missing function, try to sync with functions from the APIService.
}

// MARK: - Endpoint for later configuration

// MARK: - API Error
enum APIError: Error {
    case invalidResponse
    case decodingError(Error)
}


// MARK: ENUM STATUS ERROR CODE for later configuration
