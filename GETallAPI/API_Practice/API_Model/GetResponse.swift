//
//  GetResponse.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 07/02/24.
//

import Foundation

// MARK: - GET:/posts
struct GetResponse: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}


//import Foundation
//struct Detailsmodel : Codable {
//    let userId : Int?
//    let id : Int?
//    let title : String?
//    let body : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case userId = "userId"
//        case id = "id"
//        case title = "title"
//        case body = "body"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        title = try values.decodeIfPresent(String.self, forKey: .title)
//        body = try values.decodeIfPresent(String.self, forKey: .body)
//    }
//
//}
