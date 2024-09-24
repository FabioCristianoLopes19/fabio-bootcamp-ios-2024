//
//  GlobalService.swift
//  TudoSobreCamadaDeNetwork
//
//  Created by Fabio Cristiano Lopes on 24/09/24.
//

import Foundation

struct GlobalService {


  static func fetchListUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
    let request = APIRequest(url: "api/users?page=2")

    APIClient.shared.request(request: request, decodeType: UserListDetail.self) { result in
      switch result {
      case .success(let success):
        completion(.success(success.data))
      case .failure(let failure):
        completion(.failure(failure))
      }
    }
  }

  static func createUser(name: String, job: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {

    let request = APIRequest(url: "api/users", method: .post, headers: ["Content-Type": "application/json"], parameters: .dictionary([
      "name": name,
      "job": job
    ]))

    APIClient.shared.request(request: request) { result in
      switch result {
      case .success:
        completion(.success(()))
      case .failure(let failure):
        completion(.failure(failure))
      }
    }
  }

  
}

