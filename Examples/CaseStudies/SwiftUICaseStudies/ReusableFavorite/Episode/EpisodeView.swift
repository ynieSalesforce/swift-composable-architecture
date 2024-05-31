//
//  EpisodeView.swift
//  SwiftUICaseStudies
//
//  Created by Yuchen Nie on 5/31/24.
//  Copyright © 2024 Point-Free. All rights reserved.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct EpisodeView: View {
  let store: StoreOf<EpisodeStore>

  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      Text(store.title)

      Spacer()

      FavoriteButton(store: self.store.scope(state: \.favorite, action: \.favorite))
    }
  }
}
