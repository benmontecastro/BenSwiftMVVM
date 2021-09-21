//
//  DataModel.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import Combine

final class DataModel: ObservableObject {
    //
    // MARK: - Constants
    //
    let trackLoader = TrackLoader()
    let persistence = Persistence()

    //
    // MARK: - Variables And Properties
    //
    @Published var tracks: [Track] = []
    @Published var searchString: String = ""
    @Published var isFavoritesOnly = false
    @Published var favorites: Favorites = Favorites()
    
    //
    // MARK: - Internal Functions
    //
    func load() {
        trackLoader.getTracks() { results, error in
            if let results = results {
                self.tracks = results
            }
        }
        self.searchString = persistence.getSearchText() ?? ""
        self.isFavoritesOnly = persistence.getShowFavorites() ?? false
        favorites = Favorites()
        favorites.load()
    }
}

//
// MARK: - Preview
//
#if DEBUG
extension DataModel {
  static var sample: DataModel {
    let model = DataModel()
    model.load()
    return model
  }
}
#endif
