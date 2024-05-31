//
//  EpisodeStore.swift
//  SwiftUICaseStudies
//
//  Created by Yuchen Nie on 5/31/24.
//  Copyright © 2024 Point-Free. All rights reserved.
//

import ComposableArchitecture
import Foundation

@Reducer
struct EpisodeStore {
  @ObservableState
  struct State: Equatable, Identifiable {
    var alert: AlertState<FavoritingAction.Alert>?
    let id: UUID
    var isFavorite: Bool
    let title: String

    var favorite: FavoritingState<ID> {
      get { .init(alert: self.alert, id: self.id, isFavorite: self.isFavorite) }
      set { (self.alert, self.isFavorite) = (newValue.alert, newValue.isFavorite) }
    }
  }

  enum Action {
    case favorite(FavoritingAction)
  }

  let favorite: @Sendable (UUID, Bool) async throws -> Bool

  var body: some Reducer<State, Action> {
    Scope(state: \.favorite, action: \.favorite) {
      FavoritingStore(favorite: self.favorite)
    }
  }
}
