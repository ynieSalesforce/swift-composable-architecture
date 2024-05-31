//
//  FavoriteButton.swift
//  SwiftUICaseStudies
//
//  Created by Yuchen Nie on 5/31/24.
//  Copyright © 2024 Point-Free. All rights reserved.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct FavoriteButton<ID: Hashable & Sendable>: View {
  let store: StoreOf<FavoritingStore<ID>>

  var body: some View {
    Button {
      store.send(.buttonTapped)
    } label: {
      Image(systemName: "heart")
        .symbolVariant(store.isFavorite ? .fill : .none)
    }
    .alert(store: self.store.scope(state: \.$alert, action: \.alert))
  }
}
