//
//  ChangeValue.swift
//  PropertyWrappersBootcamp
//
//  Created by Fabio Cristiano Lopes on 06/11/24.
//

import SwiftUI

// View Pai
struct ChangeValue: View {

  @State var value: Double = 50

  var body: some View {
    VStack {
      SetValueView(newValue: $value)
      Slider(value: $value, in: 0...100, step: 1)
        .padding()
    }
  }
}

// View Filha
struct SetValueView: View {

  @Binding var newValue: Double

  var body: some View {
    VStack {
      Text("\(newValue.formatted())")
      Button("Clique aqui") {
        newValue = 10
      }
    }
  }
}



#Preview {
  ChangeValue()
}
