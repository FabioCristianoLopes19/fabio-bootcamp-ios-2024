//
//  ContentView.swift
//  PrimeiroAppSwiftUIBootcamp
//
//  Created by Fabio Cristiano Lopes on 17/10/24.
//

import SwiftUI

// VStack (Vertical Stack):
// O VStack é um layout que empilha as visualizações verticalmente, uma em cima da outra

// HStack (Horizontal Stack):
// O HStack é um layout que empilha as visualizações horizontalmente, uma ao lado da outra

// ZStack (Z-Index Stack):
// O ZStack empilha as visualizações uma em cima da outra em um plano 3D. A visualizações mais próxima será a mais visível. Isso é útil para criar sobreposições, como elementos flutuantes

struct ContentView: View {
  var body: some View {
    VStack {
      Label("Primeiro App SwiftUI Bootcamp", systemImage: "book")

      Label {
        Text("Agora vai")
          .font(.title)
          .background(Color.orange)
      } icon: {
        Image(systemName: "star")
          .frame(width: 36, height: 36)
          .background(Color.blue)

      }

      HStack(spacing: 10) {
        Text("Olá mundo")
          .font(.title)
          .background(Color.red)

        Text("Seja")
          .foregroundStyle(Color.green)
          .font(.largeTitle)
          .background(Color.yellow)
      }
    }
  }
}

#Preview {
  ContentView()
}
