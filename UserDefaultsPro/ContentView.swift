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
      
      Picker("테마 설정", selection: $userDefaultsVM._appTheme) {
        Text("시스템 설정").tag(0)
        Text("라이트 모드").tag(1)
        Text("다크 모드").tag(2)
      }
      .pickerStyle(.segmented)
    }
    .font(.title)
    .padding(.horizontal, 40)
  }
}

#Preview {
  ContentView()
}
