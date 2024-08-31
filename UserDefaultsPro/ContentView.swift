//
//  ContentView.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

// 어떻게 하면 앱을 껐다 켜도 남아있는 데이터를 만들 수 있을까?
// -> "Persistency"

struct ContentView: View {

  @State private var isToggleOn: Bool = UserDefaults.standard.bool(forKey: "isToggleOn")

  var body: some View {
    VStack(spacing: 60) {
      GroupBox("유저디폴트") {
        // 존재하지 않는 키값 조회 -> String 타입
        Text("\(UserDefaults.standard.string(forKey: "notExists"))")

        // 존재하지 않는 키값 조회 -> Bool 타입
        Text("\(UserDefaults.standard.bool(forKey: "notExists"))")

        // 존재하지 않는 키값 조회 -> Int 타입
        Text("\(UserDefaults.standard.integer(forKey: "notExists"))")
      }
      .font(.largeTitle)

      Toggle(
        "\(isToggleOn ? "토글 ON" : "토글 OFF")",
        systemImage: isToggleOn ? "lightbulb.fill" : "lightbulb",
        isOn: $isToggleOn
      )
      .symbolEffect(.bounce, value: isToggleOn) // iOS 17+
      .font(.title)
      .frame(width: 200)

      Button("토글 뒤집기") {
        // !!!: 분명 값을 바꿨지만 View 가 다시 그려지지 않는다. 재실행하면 반영됨!
        UserDefaults.standard.set(!isToggleOn, forKey: "isToggleOn")
      }
      .font(.title)
      .buttonStyle(.borderedProminent)
    }
  }
}

#Preview {
  ContentView()
}
