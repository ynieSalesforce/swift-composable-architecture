//
//  EpisodesStore.swift
//  SwiftUICaseStudies
//
//  Created by Yuchen Nie on 5/31/24.
//  Copyright © 2024 Point-Free. All rights reserved.
//

import ComposableArchitecture
import Foundation

@Reducer
struct EpisodesStore {
  @ObservableState
  struct State: Equatable {
    var episodes: IdentifiedArrayOf<EpisodeStore.State> = []
  }

  enum Action {
    case episodes(IdentifiedActionOf<EpisodeStore>)
  }

  var favorite: @Sendable (UUID, Bool) async throws -> Bool = favoriteRequest

  var body: some Reducer<State, Action> {
    Reduce { state, action in
      .none
    }
    .forEach(\.episodes, action: \.episodes) {
      EpisodeStore(favorite: self.favorite)
    }
  }
}

@Sendable private func favoriteRequest<ID>(id: ID, isFavorite: Bool) async throws -> Bool {
  try await Task.sleep(for: .seconds(1))
  if .random(in: 0...1) > 0.25 {
    return isFavorite
  } else {
    throw FavoriteError()
  }
}
