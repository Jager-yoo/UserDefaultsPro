//
//  UserDefaultsStore.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

final class UserDefaultsStore: ObservableObject {

  @AppStorage(wrappedValue: false, "isToggleOn") var isToggleOn: Bool
  @AppStorage(wrappedValue: "", "name") var name: String
  @AppStorage(wrappedValue: 0, "age") var age: Int
}
