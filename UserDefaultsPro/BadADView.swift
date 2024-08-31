//
//  BadADView.swift
//  UserDefaultsPro
//
//  Created by 유재호 on 8/31/24.
//

import SwiftUI

struct BadADView: View {

  @EnvironmentObject private var userDefaultsStore: UserDefaultsStore

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    VStack {
      Image(.hosAd)
        .resizable()
        .scaledToFit()

      Button("광고 숨기기") {
        userDefaultsStore.lastADDismissTime = Date.now.timeIntervalSince1970
        dismiss()
      }
    }
  }
}

#Preview {
  BadADView()
}
