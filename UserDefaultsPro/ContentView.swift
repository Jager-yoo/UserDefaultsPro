//
//  ContentView.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

struct ContentView: View {

  @EnvironmentObject private var userDefaultsVM: UserDefaultsViewModel

  var body: some View {
    VStack(spacing: 40) {
      Stepper(
        "Age: \(userDefaultsVM.age)",
        onIncrement: { userDefaultsVM.age += 1 },
        onDecrement: { userDefaultsVM.age -= 1 }
      )

      TextField("Enter your name", text: $userDefaultsVM.name)
        .textFieldStyle(.roundedBorder)

      Toggle(
        "\(userDefaultsVM.isToggleOn ? "Toggle ON" : "Toggle OFF")",
        systemImage: userDefaultsVM.isToggleOn ? "lightbulb.fill" : "lightbulb",
        isOn: $userDefaultsVM.isToggleOn
      )

      Toggle(
        "\(userDefaultsVM.isDarkModeOn ? "Dark-Mode ON" : "Dark-Mode OFF")",
        systemImage: userDefaultsVM.isDarkModeOn ? "moon.fill" : "sun.max.fill",
        isOn: $userDefaultsVM.isDarkModeOn
      )
    }
    .font(.title)
    .padding(.horizontal, 40)
  }
}

#Preview {
  ContentView()
}
