//
//  User.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 16.12.2023.
//

import Foundation

// MARK: - Welcome
struct UserModel: Codable {
    let id: Int
    var username, password, name, surname: String
    var information: String
    let role: Role
    let isNonLocked, isApproved, enabled: Bool
    let authorities: [Role]
    let accountNonExpired, accountNonLocked, credentialsNonExpired: Bool
}

// MARK: - Role
struct RoleModel: Codable {
    let roleID: Int
    let name, authority: String

    enum CodingKeys: String, CodingKey {
        case roleID = "roleId"
        case name, authority
    }
}
