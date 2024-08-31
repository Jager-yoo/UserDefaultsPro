//
//  ContentView.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

// 하지만 @AppStorage 의 개수가 많아지면, View 가 뚱뚱해지고, 매번 명시적으로 꺼내 쓰기도 불편하다.
// 유저디폴트만 관리하는 뷰모델로 뺄 수는 없을까?

struct ContentView: View {

  @StateObject private var userDefaultsStore = UserDefaultsStore()

  var body: some View {
    VStack(spacing: 60) {
      Stepper(
        "나이: \(userDefaultsStore.age)",
        onIncrement: { userDefaultsStore.age += 1 },
        onDecrement: { userDefaultsStore.age -= 1 }
      )
      .frame(width: 200)

      TextField("이름을 입력하세요", text: $userDefaultsStore.name)
        .textFieldStyle(.roundedBorder)
        .frame(width: 300)
        .tint(.red) // tip) 텍스트 필드 안의 수직선-캐럿(Caret)- 컬러 바꿀 수 있음

      Toggle(
        "\(userDefaultsStore.isToggleOn ? "토글 ON" : "토글 OFF")",
        systemImage: userDefaultsStore.isToggleOn ? "lightbulb.fill" : "lightbulb",
        isOn: $userDefaultsStore.isToggleOn
      )
      .symbolEffect(.bounce, value: userDefaultsStore.isToggleOn) // iOS 17+
      .frame(width: 200)

      Button("토글 뒤집기") {
        // @State 사용하듯이 유저디폴트를 쓸 수 있다. 값이 변경되면 View 도 자동으로 다시 그려짐!
        userDefaultsStore.isToggleOn.toggle()
      }
      .buttonStyle(.borderedProminent)
    }
    .font(.title)
  }
}

#Preview {
  ContentView()
}
