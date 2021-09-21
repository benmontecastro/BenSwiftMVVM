//
//  Favorites.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import SwiftUI

class Favorites: ObservableObject {
    //
    // MARK: - Variables And Properties
    //
    var trackSet: Set<Int> = []
    
    //
    // MARK: - Initialization
    //
    init() {

    }
    
    //
    // MARK: - Internal Functions
    //
    func load() {
        /// Load save data, if any, then exit
        let persistence: Persistence = Persistence()
        if persistence.getFavoriteTracks() != nil {
            let favoritesArray = persistence.getFavoriteTracks()
            trackSet = Set(favoritesArray ?? [])
        } else {
            /// Initialize, if no saved data
            self.trackSet = []
        }

    }
    
    func contains(_ track: Track) -> Bool {
        trackSet.contains(track.trackId)
    }
    
    func add(_ track: Track) {
        objectWillChange.send()
        trackSet.insert(track.trackId)
        save()
    }
    
    func remove(_ track: Track) {
        objectWillChange.send()
        trackSet.remove(track.trackId)
        save()
    }

    /// Save favorites to UserDefaults
    func save() {
        Persistence().saveFavoriteTracks(favorites: Array(trackSet))
    }
}
