//
//  UserDefaultsViewModel.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

final class UserDefaultsViewModel: ObservableObject {

  @AppStorage(Keys.isToggleOn.id) var isToggleOn: Bool = false
  @AppStorage(Keys.name.id) var name: String = ""
  @AppStorage(Keys.age.id) var age: Int = 0
  @AppStorage(Keys.appTheme.id) var _appTheme: Int = 0
  @AppStorage(Keys.shouldPresentOnboarding.id) var shouldPresentOnboarding: Bool = true

  // !!!: iOS 18+ 에서 버그 있음. 아래 링크 참고.
  // https://developer.apple.com/forums/thread/677212
  var appTheme: ColorScheme? {
    switch _appTheme {
    case 1:
      ColorScheme.light
    case 2:
      ColorScheme.dark
    default:
      nil
    }
  }

  enum Keys {
    case isToggleOn
    case name
    case age
    case appTheme
    case shouldPresentOnboarding
    case lastADDismissTime

    var id: String {
      "\(self)"
    }
  }
}
