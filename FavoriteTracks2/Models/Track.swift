//
//  Track.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import Foundation
import SwiftUI

class Track: ObservableObject {
    //
    // MARK: - Constants
    //
    let trackId: Int
    let trackName: String
    let artistName: String
    let price: Double
    let currency: String
    let genre: String
    let description: String
    let imageUrl: URL
    
    //
    // MARK: - Initialization
    //
    init(id: Int, name: String, artist: String, price: Double, currency: String, genre: String, description: String, imageUrl: URL) {
        self.trackId = id
        self.trackName = name
        self.artistName = artist
        self.price = price
        self.currency = currency
        self.genre = genre
        self.description = description
        self.imageUrl = imageUrl
    }
    
    //
    // MARK: - Internal Methods
    //
    func isFavorite() -> Bool {
        let favorites = Favorites()
        favorites.load()
        return favorites.contains(self)
    }
}
