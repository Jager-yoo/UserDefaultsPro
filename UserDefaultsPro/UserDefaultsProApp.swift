//
//  UserDefaultsProApp.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

@main
struct UserDefaultsProApp: App {

  @StateObject private var userDefaultsVM = UserDefaultsViewModel()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .preferredColorScheme(userDefaultsVM.appTheme)
        .sheet(
          isPresented: $userDefaultsVM.shouldPresentOnboarding,
          onDismiss: { userDefaultsVM.shouldPresentOnboarding = false }
        )
      {
        OnboardingView()
      }
    }
    .environmentObject(userDefaultsVM)
  }
}
