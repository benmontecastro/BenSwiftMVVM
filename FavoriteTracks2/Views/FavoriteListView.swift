//
//  FavoriteListView.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 30/9/21.
//

import SwiftUI

struct FavoriteListView: View {
    @EnvironmentObject var model: DataModel
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            List(model.tracks.filter( { $0.isFavorite() } ), id: \.trackId) {
                track in
                /// Link to Detail view
                NavigationLink(destination: TrackDetailView(track: track)) {
                    TrackRowView(track: track)
                }
            }
            .navigationBarTitle("Favorites", displayMode: .inline)
            .listStyle(PlainListStyle())
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        FavoriteListView()
            .environmentObject(model)
            .environmentObject(model.favorites)
    }
}
