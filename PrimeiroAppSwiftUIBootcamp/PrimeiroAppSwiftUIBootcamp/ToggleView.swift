//
//  ToggleView.swift
//  PrimeiroAppSwiftUIBootcamp
//
//  Created by Fabio Cristiano Lopes on 21/10/24.
//

import SwiftUI

struct ToggleView: View {

    @State var isOn: Bool = false

    var body: some View {
      ZStack {
        Color(isOn ? .blue : .orange)
        Toggle("", isOn: $isOn)
          .labelsHidden()
      }
    }
}

#Preview {
    ToggleView()
}
