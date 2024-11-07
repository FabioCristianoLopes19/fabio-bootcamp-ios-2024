//
//  ContentView.swift
//  ListasComSwiftUI
//
//  Created by Fabio Cristiano Lopes on 04/11/24.
//

import SwiftUI

struct ListWithSection: View {

  var body: some View {
    List {
      Group {
        Section {
          Text("Section 1")
          Text("Section 1")
          Text("Section 1")
          Text("Section 1")
        } header: {
          Text("Section 1 titulo")
            .foregroundStyle(Color.red)
        }

        Section {
          Text("Section 2")
          Text("Section 2")
        } header: {
          Text("Section 2 titulo")
            .foregroundStyle(Color.blue)
        }

        Section {
          Text("Section 3")
          Text("Section 3")
          Text("Section 3")
          Text("Section 3")
          Text("Section 3")
          Text("Section 3")
        } header: {
          Text("Section 3 titulo")
            .foregroundStyle(Color.yellow)
        }

        Section {
          Text("Section 4")
        } header: {
          Text("Section 4 titulo")
            .foregroundStyle(Color.purple)
        }
      }
      .listRowSeparator(.hidden)
      .headerProminence(.increased)
    }
    .listStyle(.grouped)
  }
}

#Preview {
  ListWithSection()
}
