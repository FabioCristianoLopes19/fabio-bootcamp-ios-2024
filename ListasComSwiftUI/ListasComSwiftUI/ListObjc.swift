//
//  ContentView.swift
//  ListasComSwiftUI
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

struct Person: Identifiable {
  var id = UUID()
  var name: String
  var lastName: String
}

struct ListObjc: View {

  let persons: [Person] = [
    Person(name: "Caio", lastName: "Fabrini"),
    Person(name: "João", lastName: "Das Coves"),
    Person(name: "Pedro", lastName: "Pimenta"),
  ]

  var body: some View {

// Modo no qual vai conter todas as celulas do mesmo objeto!!

//    List(persons) { person in
//      VStack(alignment: .leading) {
//        Text(person.name)
//          .font(.headline)
//        Text(person.lastName)
//          .font(.headline)
//      }
//    }

// Modo no qual as celulas são diferentes

    List {
      Text("Primeira celula!!!")

      ForEach(persons) { person in

        if person.name == "João" {
          Text("Testes")
        } else {
          VStack(alignment: .leading) {
            Text(person.name)
              .font(.headline)
            Text(person.lastName)
              .font(.headline)
          }
        }
      }

      Text("Ultima celula!!!")
    }
  }
}

#Preview {
  ListObjc()
}
