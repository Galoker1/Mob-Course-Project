//
//  RecipeNetworkModel.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 19.11.2023.
//

import Foundation

// MARK: - WelcomeElement
struct RecipeNetworkModel: Codable {
    let id: Int
    let name, product, cookingMethod, linkToPicture: String
    let author: Author
}

// MARK: - Author
struct Author: Codable {
    let id: Int
    let username, password, name, surname: String
    let information: String
    let role: Role
    let isNonLocked, isApproved, enabled: Bool
    let authorities: [Role]
    let accountNonExpired, accountNonLocked, credentialsNonExpired: Bool
}

// MARK: - Role
struct Role: Codable {
    let roleID: Int
    let name, authority: String

    enum CodingKeys: String, CodingKey {
        case roleID = "roleId"
        case name, authority
    }
}

typealias RecipeNetworkModels = [RecipeNetworkModel]
