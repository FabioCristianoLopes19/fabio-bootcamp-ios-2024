//
//  Service.swift
//  TudoSobreCamadaDeNetwork
//
//  Created by Fabio Cristiano Lopes on 13/09/24.
//

import Foundation

struct ErrorHandler: Error {
  let message: String
  let statusCode: Int?
}

class Service {

  static func fetchListUsers(completion: @escaping (Result<[User], ErrorHandler>) -> Void) {
    // URL fornecida
    let urlString = "https://reqres.in/api/users?page=2"

    // Verificar se o formato da URL é valida, e transformar ela em um tipo URL
    guard let url = URL(string: urlString) else {
      completion(.failure(ErrorHandler(message: "URL inválida", statusCode: nil)))
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in

      // estamos verificando se existe o error e com isso removendo sua opcionalidade
      if let error {
        completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
        return
      }

      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(ErrorHandler(message: "Resposta inválida do servidor.", statusCode: nil)))
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou sucesso! Caso contrario, error!
      guard (200...299).contains(httpResponse.statusCode) else {
        completion(.failure(ErrorHandler(message: "Status code fora do esperado.", statusCode: httpResponse.statusCode)))
        return
      }

      // Removendo opcionalidade
      //    guard let data = data else { return }
      guard let data else { return }

      do {
        let userDetail = try JSONDecoder().decode(UserListDetail.self, from: data)
        completion(.success(userDetail.data))
      } catch {
        completion(.failure(ErrorHandler(message: "Error ao processar os dados recebidos: \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
        return
      }
    }
    // Inicia a requisição
    task.resume()
  }

  static func fetchUser(id: Int, completion: @escaping (Result<User, ErrorHandler>) -> Void) {
    // URL fornecida
    let urlString = "https://reqres.in/api/users/\(id)"

    // Verificar se o formato da URL é valida, e transformar ela em um tipo URL
    guard let url = URL(string: urlString) else {
      completion(.failure(ErrorHandler(message: "URL inválida", statusCode: nil)))
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in

      // estamos verificando se existe o error e com isso removendo sua opcionalidade
      if let error {
        completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
        return
      }

      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(ErrorHandler(message: "Resposta inválida do servidor.", statusCode: nil)))
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou sucesso! Caso contrario, error!
      guard (200...299).contains(httpResponse.statusCode) else {
        completion(.failure(ErrorHandler(message: "Status code fora do esperado.", statusCode: httpResponse.statusCode)))
        return
      }

      // Removendo opcionalidade
      //    guard let data = data else { return }
      guard let data else { return }

      do {
        let userDetail = try JSONDecoder().decode(UserDetail.self, from: data)
        completion(.success(userDetail.data))
      } catch {
        completion(.failure(ErrorHandler(message: "Error ao processar os dados recebidos: \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
        return
      }
    }
    // Inicia a requisição
    task.resume()
  }

  static func createUser(name: String, job: String, completion: @escaping (Result<UserCreateResponse, ErrorHandler>) -> Void) {
    // URL fornecida
    let urlString = "https://reqres.in/api/users"

    // Verificar se o formato da URL é valida, e transformar ela em um tipo URL
    guard let url = URL(string: urlString) else {
      completion(.failure(ErrorHandler(message: "URL inválida", statusCode: nil)))
      return
    }

    // Cria o corpo da requisição com os parâmetros
    let parameters: [String: Any] = [
      "name": name,
      "job": job
    ]

    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters) else {
      completion(.failure(ErrorHandler(message: "Error ao converter os parâmetros", statusCode: nil)))
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = httpBody
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in

      // estamos verificando se existe o error e com isso removendo sua opcionalidade
      if let error {
        completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
        return
      }

      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(ErrorHandler(message: "Resposta inválida do servidor.", statusCode: nil)))
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou sucesso! Caso contrario, error!
      guard (200...299).contains(httpResponse.statusCode) else {
        completion(.failure(ErrorHandler(message: "Status code fora do esperado.", statusCode: httpResponse.statusCode)))
        return
      }

      // Removendo opcionalidade
      //    guard let data = data else { return }
      guard let data else { return }

      do {
        let objc = try JSONDecoder().decode(UserCreateResponse.self, from: data)
        completion(.success(objc))
      } catch {
        completion(.failure(ErrorHandler(message: "Error ao processar os dados recebidos: \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
        return
      }
    }
    // Inicia a requisição
    task.resume()
  }

  static func updateUserParameters(name: String, job: String, id: Int, completion: @escaping (Result<UserUpdateResponse, ErrorHandler>) -> Void) {
    // URL fornecida
    let urlString = "https://reqres.in/api/users/\(id)"

    // Verificar se o formato da URL é valida, e transformar ela em um tipo URL
    guard let url = URL(string: urlString) else {
      completion(.failure(ErrorHandler(message: "URL inválida", statusCode: nil)))
      return
    }

    // Cria o corpo da requisição com os parâmetros
    let parameters: [String: Any] = [
      "name": name,
      "job": job
    ]

    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters) else {
      completion(.failure(ErrorHandler(message: "Error ao converter os parâmetros", statusCode: nil)))
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.httpBody = httpBody
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in

      // estamos verificando se existe o error e com isso removendo sua opcionalidade
      if let error {
        completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
        return
      }

      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(ErrorHandler(message: "Resposta inválida do servidor.", statusCode: nil)))
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou sucesso! Caso contrario, error!
      guard (200...299).contains(httpResponse.statusCode) else {
        completion(.failure(ErrorHandler(message: "Status code fora do esperado.", statusCode: httpResponse.statusCode)))
        return
      }

      // Removendo opcionalidade
      //    guard let data = data else { return }
      guard let data else { return }

      do {
        let objc = try JSONDecoder().decode(UserUpdateResponse.self, from: data)
        completion(.success(objc))
      } catch {
        completion(.failure(ErrorHandler(message: "Error ao processar os dados recebidos: \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
        return
      }
    }
    // Inicia a requisição
    task.resume()
  }

  static func updateUserEncodable(user: UpdateUserRequest, id: Int, completion: @escaping (Result<UserUpdateResponse, ErrorHandler>) -> Void) {
    // URL fornecida
    let urlString = "https://reqres.in/api/users/\(id)"

    // Verificar se o formato da URL é valida, e transformar ela em um tipo URL
    guard let url = URL(string: urlString) else {
      completion(.failure(ErrorHandler(message: "URL inválida", statusCode: nil)))
      return
    }

    guard let httpBody = try? JSONEncoder().encode(user) else {
      completion(.failure(ErrorHandler(message: "Error ao converter os parâmetros", statusCode: nil)))
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.httpBody = httpBody
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in

      // estamos verificando se existe o error e com isso removendo sua opcionalidade
      if let error {
        completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
        return
      }

      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(ErrorHandler(message: "Resposta inválida do servidor.", statusCode: nil)))
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou sucesso! Caso contrario, error!
      guard (200...299).contains(httpResponse.statusCode) else {
        completion(.failure(ErrorHandler(message: "Status code fora do esperado.", statusCode: httpResponse.statusCode)))
        return
      }

      // Removendo opcionalidade
      //    guard let data = data else { return }
      guard let data else { return }

      do {
        let objc = try JSONDecoder().decode(UserUpdateResponse.self, from: data)
        completion(.success(objc))
      } catch {
        completion(.failure(ErrorHandler(message: "Error ao processar os dados recebidos: \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
        return
      }
    }
    // Inicia a requisição
    task.resume()
  }

  static func deleteUser(id: Int, completion: @escaping (Result<Void, ErrorHandler>) -> Void) {
    // URL fornecida
    let urlString = "https://reqres.in/api/users/\(id)"

    // Verificar se o formato da URL é valida, e transformar ela em um tipo URL
    guard let url = URL(string: urlString) else {
      completion(.failure(ErrorHandler(message: "URL inválida", statusCode: nil)))
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in

      // estamos verificando se existe o error e com isso removendo sua opcionalidade
      if let error {
        completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
        return
      }

      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(ErrorHandler(message: "Resposta inválida do servidor.", statusCode: nil)))
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou sucesso! Caso contrario, error!
      guard (200...299).contains(httpResponse.statusCode) else {
        completion(.failure(ErrorHandler(message: "Status code fora do esperado.", statusCode: httpResponse.statusCode)))
        return
      }
      completion(.success(()))
    }
    // Inicia a requisição
    task.resume()
  }
}

