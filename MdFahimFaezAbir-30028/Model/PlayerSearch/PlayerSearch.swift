//
//  PlayerSearch.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 23/2/23.
//

import Foundation
struct PlayerSearch: Codable {
    var data: [PlayerData]?
}

// MARK: - Datum
struct PlayerData: Codable {
    var resource: String?
    var id: Int?
    var fullname: String?
    var imagePath: String?
    var country: PlayerCountry?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id, fullname
        case imagePath = "image_path"
        case country
        case updatedAt = "updated_at"
    }
}

// MARK: - Country
struct PlayerCountry: Codable {
    var resource: String?
    var id, continentID: Int?
    var name: String?
    var imagePath: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case continentID = "continent_id"
        case name
        case imagePath = "image_path"
        case updatedAt = "updated_at"
    }
}

