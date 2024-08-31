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

  @EnvironmentObject private var userDefaultsStore: UserDefaultsStore

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
        .tint(.red) // tip) 텍스트 필드 안의 수직선-캐럿(Caret)-컬러 바꿀 수 있음

      Toggle(
        "\(userDefaultsStore.isToggleOn ? "토글 ON" : "토글 OFF")",
        systemImage: userDefaultsStore.isToggleOn ? "lightbulb.fill" : "lightbulb",
        isOn: $userDefaultsStore.isToggleOn
      )
      .symbolEffect(.bounce, value: userDefaultsStore.isToggleOn) // iOS 17+
      .frame(width: 200)

      HStack {
        Label(
          "\(userDefaultsStore.isDarkModeOn ? "다크모드 ON" : "다크모드 OFF")",
          systemImage: userDefaultsStore.isDarkModeOn ? "moon.fill" : "sun.max.fill"
        )
        .symbolEffect(.bounce, value: userDefaultsStore.isDarkModeOn) // iOS 17+

        Toggle("", isOn: $userDefaultsStore.isDarkModeOn)
          .labelsHidden()
      }

      VStack {
        Text("마지막으로 광고 본 시간")
        if let lastADDismissTime = userDefaultsStore.lastADDismissTime {
          Text(Date(timeIntervalSince1970: lastADDismissTime), style: .relative)
        }
      }
    }
    .font(.title)
    .sheet(isPresented: Binding(
      get: { userDefaultsStore.shouldShowBadAD },
      set: { _ in }))
    {
      BadADView()
        .interactiveDismissDisabled()
        .presentationDetents([.medium, .fraction(0.7)])
    }
  }
}

#Preview {
  ContentView()
}
