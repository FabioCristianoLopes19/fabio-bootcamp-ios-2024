//
//  ContentView.swift
//  NotasBootcamp
//
//  Created by Fabio Cristiano Lopes on 06/11/24.
//

import SwiftUI

struct LoginView: View {

  @State var email: String = ""
  @State var password: String = ""
  @State var goNoteView: Bool = false

  var body: some View {
      ZStack {
        Color.backgroundColor.ignoresSafeArea()
        VStack {
          Text("Login")
            .font(.system(size: 45, weight: .bold))
            .foregroundColor(.white)
            .padding(.top, 20)

          Spacer()

          Group {
            TextField("", text: $email, prompt: Text("Digite seu email").foregroundStyle(Color.white))
              .keyboardType(.emailAddress)

            SecureField("", text: $password, prompt: Text("Digite sua senha").foregroundStyle(Color.white))

          }
          .frame(height: 40)
          .padding(6)
          .overlay {
            RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2)
          }
          .padding(6)
          .padding(.horizontal)
          .foregroundStyle(Color.white)


          Spacer()

          Button {
            goNoteView.toggle()
          } label: {
            Text("Login")
              .frame(height: 45)
              .frame(maxWidth: .infinity)
              .foregroundStyle(.white)
              .background(Color.blue)
              .clipShape(RoundedRectangle(cornerRadius: 8))
              .padding()
          }

          Spacer()

          Button {
            // metodo de acao
          } label: {
            Text("Não tem conta? Cadastre-se")
              .frame(height: 45)
              .foregroundStyle(.white)
              .padding()
          }
        }
        .fullScreenCover(isPresented: $goNoteView) {
          NotesView()
        }
      }
    }
}

#Preview {
  LoginView()
}
