//
//  CollectionView.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 15/02/24.
//

import Foundation

struct CollectionViewData: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
