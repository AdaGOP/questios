//
//  APIErrorResponse.swift
//  Questios
//
//  Created by David Gunawan on 04/06/24.
//

import Foundation

// MARK: - APIErrorResponse
struct APIErrorResponse: APIError {
    let message: String
    let statusCode: Int
}
