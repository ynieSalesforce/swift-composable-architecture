//
//  EpisodesView.swift
//  SwiftUICaseStudies
//
//  Created by Yuchen Nie on 5/31/24.
//  Copyright © 2024 Point-Free. All rights reserved.
//

import ComposableArchitecture
import Foundation
import SwiftUI

private let readMe = """
  This screen demonstrates how one can create reusable components in the Composable Architecture.

  It introduces the domain, logic, and view around "favoriting" something, which is considerably \
  complex.

  A feature can give itself the ability to "favorite" part of its state by embedding the domain of \
  favoriting, using the `Favoriting` reducer, and passing an appropriately scoped store to \
  `FavoriteButton`.

  Tapping the favorite button on a row will instantly reflect in the UI and fire off an effect to \
  do any necessary work, like writing to a database or making an API request. We have simulated a \
  request that takes 1 second to run and may fail 25% of the time. Failures result in rolling back \
  favorite state and rendering an alert.
  """

struct EpisodesView: View {
  let store: StoreOf<EpisodesStore>

  var body: some View {
    Form {
      Section {
        AboutView(readMe: readMe)
      }
      ForEach(
        store.scope(state: \.episodesState, action: \.episodesAction),
        id: \.state.id
      ) { rowStore in
        EpisodeView(store: rowStore)
      }.buttonStyle(.borderless)
    }
    .navigationTitle("Favoriting")
  }
}
