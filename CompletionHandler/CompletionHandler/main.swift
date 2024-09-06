//
//  main.swift
//  CompletionHandler
//
//  Created by Fabio Cristiano Lopes on 05/09/24.
//

import Foundation

struct ExploreService {
  // todo metodo que não tem retorno explicito ele retorna o tipo VOID (vazio)
  func getTest() -> Void {
    return
  }

  func getJSON() -> Int {
    return 1000
  }

  // Utilizando o @escaping -> o completion se torna assíncrono, já sem ele permanece síncrono.
  func loadJSON(completion: @escaping (Int) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {

      completion(4234324)
    }
  }
}

var service = ExploreService()

print(service.getJSON())

service.loadJSON { value in
  print(value)
}
print("teste")
