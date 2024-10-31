//
//  ProgressView.swift
//  PrimeiroAppSwiftUIBootcamp
//
//  Created by Fabio Cristiano Lopes on 21/10/24.
//

import SwiftUI

struct ProgressViewTeste: View {


  @State var progress: Double = 0

    var body: some View {
      VStack(spacing: 20) {
        Button("Avançar") {
          progress += 0.5
        }

        ProgressView(value: progress, total: 10)

        Button("Diminuir") {
          progress -= 0.5
        }
      }
      .padding()
    }
}

#Preview {
  ProgressViewTeste()
}
