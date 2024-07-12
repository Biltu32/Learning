//
//  GetResponseComments.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 07/02/24.
//

import Foundation

// MARK: - GET:/posts/1/comments
struct GetResponseComments: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

