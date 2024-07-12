//
//  GetResponseNumber.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 07/02/24.
//

import Foundation

// MARK: - GET:/posts/1
struct GetResponseNumber: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
