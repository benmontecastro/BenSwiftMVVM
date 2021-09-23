//
//  ContentView.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: DataModel
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        AppUsageView()
        
        SearchBarView(searchText: $model.searchString)
            .padding(5)

        NavigationView {
            List(model.tracks.filter( { model.isFavoritesOnly ? $0.isFavorite() : model.searchString.isEmpty ? true : $0.trackName.contains(model.searchString) } ), id: \.trackId) {
                track in
                /// Link to Detail view
                NavigationLink(destination: TrackDetailView(track: track)) {
                    TrackRowView(track: track)
                }
            }
            .navigationBarTitle("Tracks", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    model.isFavoritesOnly = !model.isFavoritesOnly
                }) {
                    Image(systemName: "star.fill").imageScale(.medium)
                        .foregroundColor( model.isFavoritesOnly ? .green : .gray )
                        .border( model.isFavoritesOnly ? Color.green : Color.gray )
                }
            )
            .listStyle(PlainListStyle())
            .onChange(of: model.searchString, perform: { value in
                Persistence().saveSearchText(text: value)
            })
            .onChange(of: model.isFavoritesOnly, perform: { value in
                Persistence().saveShowFavorites(show: value)
            })
        }

        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        ContentView()
            .environmentObject(model)
            .environmentObject(model.favorites)
    }
}
