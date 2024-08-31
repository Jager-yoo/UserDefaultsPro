//
//  UserDefaultsStore.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

final class UserDefaultsStore: ObservableObject {

  // 기초
  @AppStorage("isToggleOn") var isToggleOn: Bool = false
  @AppStorage("name") var name: String = ""
  @AppStorage("age") var age: Int = 0

  // 심화
  @AppStorage("isDarkModeOn") var isDarkModeOn: Bool = false
  @AppStorage("shouldPresentOnboarding") var shouldPresentOnboarding: Bool = true
  @AppStorage("lastADDismissTime") var lastADDismissTime: TimeInterval?

  var shouldShowBadAD: Bool {
    guard shouldPresentOnboarding == false else { return false } // 온보딩하고 충돌하면 안 됨
    guard let lastADDismissTime else { return true } // 아직 광고 본 적 없으면 nil 이란 것. true 나감
    return (Date.now.timeIntervalSince1970 - lastADDismissTime) >= 10 // 10초 이상 지났다면 true 나감
  }
}
