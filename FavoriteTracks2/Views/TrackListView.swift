//
//  TrackListView.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 30/9/21.
//

import SwiftUI

struct TrackListView: View {
    @EnvironmentObject var model: DataModel
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
//        SearchBarView(searchText: $model.searchString)
//            .padding(6)
        NavigationView {
            List(model.tracks.filter( { model.searchString.isEmpty ? true : $0.trackName.contains(model.searchString) } ), id: \.trackId) {
                track in
                /// Link to Detail view
                NavigationLink(destination: TrackDetailView(track: track)) {
                    TrackRowView(track: track)
                }
            }
            .navigationBarTitle("Tracks", displayMode: .inline)
            .listStyle(PlainListStyle())
//            .onChange(of: model.searchString, perform: { value in
//                Persistence().saveSearchText(text: value)
//            })
            
            Spacer()
        }
    }
}

struct TrackListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        TrackListView()
            .environmentObject(model)
            .environmentObject(model.favorites)
    }
}
