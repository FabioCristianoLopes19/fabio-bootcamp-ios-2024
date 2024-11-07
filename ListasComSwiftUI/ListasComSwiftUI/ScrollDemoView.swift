//
//  ScrollDemoView.swift
//  ListasComSwiftUI
//
//  Created by Fabio Cristiano Lopes on 06/11/24.
//

import SwiftUI

struct ScrollDemoView: View {

  @State var selectedPosition: UUID? = nil

  let persons: [Person] = [
    Person(name: "Caio", lastName: "Fabrini"),
    Person(name: "João", lastName: "Das Coves"),
    Person(name: "Pedro", lastName: "Pimenta"),
    Person(name: "Lucas", lastName: "Pimenta"),
    Person(name: "Alves", lastName: "Pimenta"),
    Person(name: "Neto", lastName: "Pimenta"),
  ]

    var body: some View {
      VStack {
        ScrollView(.vertical) {
          LazyVStack {
            ForEach(0..<11) { index in
              Text("Posição \(index)")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.blue)
            }
            Group {
              Text("Olá, mundo!")
                .frame(maxWidth: .infinity)
                .frame(height: 90)
                .background(Color.green)

              Text("Olá, mundo 2!")
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Color.red)

              Text("Olá, mundo 3!")
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .background(Color.orange)
                .font(.title3)
            }
            .font(.title)
          }
        }
        ScrollView(.horizontal) {
          HStack {
            ForEach(persons) { person in
              Text(person.name)
                .font(.headline)
                .frame(width: 100, height: 100)
                .background(selectedPosition == person.id ? Color.red : Color.clear)
                .onTapGesture {
                  selectedPosition = person.id
                  print("Tapped \(person.name)")
                }
            }
          }
        }
      }
      .padding()
    }
}

#Preview {
    ScrollDemoView()
}
