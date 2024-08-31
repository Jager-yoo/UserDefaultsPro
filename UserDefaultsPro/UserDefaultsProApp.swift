//
//  UserDefaultsProApp.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

@main
struct UserDefaultsProApp: App {

  @StateObject private var userDefaultsStore = UserDefaultsStore()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .preferredColorScheme(userDefaultsStore.isDarkModeOn ? .dark : .light)
    }
    .environmentObject(userDefaultsStore)
  }
}
