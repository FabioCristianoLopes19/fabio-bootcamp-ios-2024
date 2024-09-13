//
//  UserListDetail.swift
//  TudoSobreCamadaDeNetwork
//
//  Created by Fabio Cristiano Lopes on 13/09/24.
//

import Foundation

// MARK: - UserDetail
struct UserListDetail: Codable {
    var data: [User]
}

// MARK: - Datum
struct User: Codable {
    var id: Int
    var email, firstName, lastName: String
    var avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    var url: String
    var text: String
}
