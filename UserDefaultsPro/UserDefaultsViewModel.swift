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
  @AppStorage(Keys.isDarkModeOn.id) var isDarkModeOn: Bool = false
  @AppStorage(Keys.shouldPresentOnboarding.id) var shouldPresentOnboarding: Bool = true

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
}
