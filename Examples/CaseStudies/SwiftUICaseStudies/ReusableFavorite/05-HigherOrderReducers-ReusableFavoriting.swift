import ComposableArchitecture
import SwiftUI

struct FavoriteError: LocalizedError, Equatable {
  var errorDescription: String? {
    "Favoriting failed."
  }
}

extension IdentifiedArray where ID == EpisodeStore.State.ID, Element == EpisodeStore.State {
  static let mocks: Self = [
    EpisodeStore.State(id: UUID(), isFavorite: false, title: "Functions"),
    EpisodeStore.State(id: UUID(), isFavorite: false, title: "Side Effects"),
    EpisodeStore.State(id: UUID(), isFavorite: false, title: "Algebraic Data Types"),
    EpisodeStore.State(id: UUID(), isFavorite: false, title: "DSLs"),
    EpisodeStore.State(id: UUID(), isFavorite: false, title: "Parsers"),
    EpisodeStore.State(id: UUID(), isFavorite: false, title: "Composable Architecture"),
  ]
}

#Preview {
  NavigationStack {
    EpisodesView(
      store: Store(initialState: EpisodesStore.State(episodes: .mocks)) {
        EpisodesStore()
      }
    )
  }
}
