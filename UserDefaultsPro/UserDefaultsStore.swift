//
//  UserDefaultsStore.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

final class UserDefaultsStore: ObservableObject {

  enum Keys {
    case isToggleOn
    case name
    case age
    case isDarkModeOn
    case shouldPresentOnboarding
    case lastADDismissTime

    var id: String {
      "\(self)"
    }
  }
  
  // 기초
  @AppStorage(Keys.isToggleOn.id) var isToggleOn: Bool = false
  @AppStorage(Keys.name.id) var name: String = ""
  @AppStorage(Keys.age.id) var age: Int = 0

  // 응용
  @AppStorage(Keys.isDarkModeOn.id) var isDarkModeOn: Bool = false
  @AppStorage(Keys.shouldPresentOnboarding.id) var shouldPresentOnboarding: Bool = true
  @AppStorage(Keys.lastADDismissTime.id) var lastADDismissTime: TimeInterval?

  var shouldShowBadAD: Bool {
    guard shouldPresentOnboarding == false else { return false } // 온보딩하고 충돌하면 안 됨
    guard let lastADDismissTime else { return true } // 아직 광고 본 적 없으면 nil 이란 것. true 나감
    return (Date.now.timeIntervalSince1970 - lastADDismissTime) >= 10 // 10초 이상 지났다면 true 나감
  }
}
