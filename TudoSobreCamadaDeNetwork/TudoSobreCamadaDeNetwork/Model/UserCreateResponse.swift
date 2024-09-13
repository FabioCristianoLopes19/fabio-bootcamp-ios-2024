//
//  UserCreateResponse.swift
//  TudoSobreCamadaDeNetwork
//
//  Created by Fabio Cristiano Lopes on 13/09/24.
//

import Foundation

// MARK: - UserCreateResponse
struct UserCreateResponse: Codable {
    var name, job, id, createdAt: String?
}

