//
//  PostImages.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 14/03/2024.
//

import Foundation

// MARK: - PostImages
struct PostImages: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
