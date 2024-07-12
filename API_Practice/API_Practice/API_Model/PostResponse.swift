//
//  PostResponse.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 02/02/24.
//

import Foundation

// MARK: - Testing
struct PostResponse: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
typealias TestingResponse = [PostResponse]
