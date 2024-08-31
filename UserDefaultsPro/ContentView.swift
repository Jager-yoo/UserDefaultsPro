//
//  ContentView.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

// UserDefaults 와 SwiftUI 는 같이 쓰기 적합하지 않다.
// 이를 해결하기 위해 애플이 iOS 14 에서 @AppStorage 를 만들어줬다.

struct ContentView: View {

//  @State private var isToggleOn: Bool = UserDefaults.standard.bool(forKey: "isToggleOn")
  @AppStorage("isToggleOn") private var isToggleOn: Bool = false
  // 이렇게 생긴 이니셜라이저도 있음ㅋ 디폴트 값
  @AppStorage(wrappedValue: false, "isToggleOn2") private var isToggleOn2: Bool

  var body: some View {
    VStack(spacing: 60) {
      Toggle(
        "\(isToggleOn ? "토글 ON" : "토글 OFF")",
        systemImage: isToggleOn ? "lightbulb.fill" : "lightbulb",
        isOn: $isToggleOn
      )
      .symbolEffect(.bounce, value: isToggleOn) // iOS 17+
      .font(.title)
      .frame(width: 200)

      Button("토글 뒤집기") {
        // @State 사용하듯이 유저디폴트를 쓸 수 있다. 값이 변경되면 View 도 자동으로 다시 그려짐!
        self.isToggleOn.toggle()
      }
      .font(.title)
      .buttonStyle(.borderedProminent)
    }
  }
}

#Preview {
  ContentView()
}
