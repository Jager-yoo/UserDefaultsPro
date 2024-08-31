//
//  UserDefaultsStore.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

final class UserDefaultsStore: ObservableObject {

  // 기초
  @AppStorage(wrappedValue: false, "isToggleOn") var isToggleOn: Bool
  @AppStorage(wrappedValue: "", "name") var name: String
  @AppStorage(wrappedValue: 0, "age") var age: Int

  // 심화
  @AppStorage(wrappedValue: false, "isDarkModeOn") var isDarkModeOn: Bool
  @AppStorage(wrappedValue: true, "shouldPresentOnboarding") var shouldPresentOnboarding: Bool
  @AppStorage(wrappedValue: 0, "lastAdDismissalTime") var lastAdDismissalTime: TimeInterval

  var shouldShowBadAD: Bool {
    guard shouldPresentOnboarding == false else { return false }
    let currentTime = Date.now.timeIntervalSince1970
    let timeSinceLastAd = currentTime - lastAdDismissalTime
    return timeSinceLastAd >= 10 // 10초 이상 지났다면 true 나감
  }
}
