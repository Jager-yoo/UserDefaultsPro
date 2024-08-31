//
//  ContentView.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

struct ContentView: View {

  @State private var isToggleOn: Bool = false

  var body: some View {
    VStack {
      Text("앱을 껐다 켜도 Toggle 상태가 유지될까?")
        .font(.largeTitle)

      Toggle(
        "\(isToggleOn ? "토글 ON" : "토글 OFF")",
        systemImage: isToggleOn ? "lightbulb.fill" : "lightbulb",
        isOn: $isToggleOn
      )
      .symbolEffect(.bounce, value: isToggleOn) // iOS 17+
      .font(.title)
      .frame(width: 200)
    }
  }
}

#Preview {
  ContentView()
}
