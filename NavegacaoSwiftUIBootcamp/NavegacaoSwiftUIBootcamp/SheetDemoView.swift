//
//  ContentView.swift
//  NavegacaoSwiftUIBootcamp
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

// MARK: - Navegação de APRESENTAÇÃO!!

// Essa navegação, é como se fosse o Modal do UIKit

struct SheetDemoView: View {

    @State var isPresentSheet: Bool = false
    @State var isPresentFullScreen: Bool = false

    var body: some View {
      VStack(spacing: 20) {
          Button("Apresentar Sheet") {
            isPresentSheet.toggle()
          }

          Button("Apresentar Full Screen") {
            isPresentFullScreen.toggle()
          }

          .sheet(isPresented: $isPresentSheet) {
            Tela02View()
          }
          .fullScreenCover(isPresented: $isPresentFullScreen) {
            Tela02View()
          }
        }
        .padding()
    }
}

struct Tela02View: View {

  @Environment(\.dismiss) var dismiss

  var body: some View {
    ZStack {
      Color.red
      VStack {
        Text("Olá mundo!")
        Button("Voltar") {
          dismiss()
        }
      }
    }
  }
}

#Preview {
  SheetDemoView()
}
