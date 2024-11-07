//
//  NavigationDemoView.swift
//  NavegacaoSwiftUIBootcamp
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

/*
 MARK: NavigationView
                O NavigationView é um contêiner que fornece uma barra de navegação no topo da tela. Você pode adicionar visualizações dentro do NavigationView e usar NavigationLink para navegar entre elas.

 OBS: O NavigationView é muito semelhante ao NavigationController do UIKit
 */

struct NavigationDemoView: View {

  @State var goNavigation: Bool = false

    var body: some View {
      NavigationView {

        VStack(spacing: 20) {
          NavigationLink("Ir para a tela 02 com texto nativo", destination: {
            Tela02View()
          })

          NavigationLink(destination: Tela02View(), label: {
            Text("Ir para a tela 02 com texto customizável")
              .font(.headline)
              .foregroundStyle(Color.black)
          })

          Button("Tela 02 programaticamente") {
            goNavigation.toggle()
          }

          NavigationLink(destination: Tela02View(), isActive: $goNavigation) { EmptyView() }
        }
          .navigationBarTitle("Navegações")
          .navigationBarTitleDisplayMode(.large)
      }
    }
}

#Preview {
    NavigationDemoView()
}
