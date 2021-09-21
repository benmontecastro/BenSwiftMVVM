//
//  TrackDetailView.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import SwiftUI

struct TrackDetailView: View {
    @ObservedObject var track: Track
    
    /// Shared within the app
    @EnvironmentObject var model: DataModel
    @EnvironmentObject var favorites: Favorites

    var body: some View {
        VStack {
            Text("\(track.trackName)")
                .font(.headline)
                .padding()

            Text(track.description)
                .multilineTextAlignment(.leading)
                .padding()

            Button(model.favorites.contains(track) ? "Remove from Favorites" : "Add to Favorites") {
                if model.favorites.contains(track) {
                    model.favorites.remove(track)
                } else {
                    model.favorites.add(track)
                }
            }
                .padding()

            Spacer()
        }
    }
}

struct TrackDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        let track = model.tracks[1]
        TrackDetailView(track: track)
    }
}
