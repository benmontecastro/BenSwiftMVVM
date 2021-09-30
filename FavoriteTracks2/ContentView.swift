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
    @State var selectedTab: Tab = .list

    enum Tab {
        case list
        case faves
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            AppUsageView()

            TabView(selection: $selectedTab) {
                TrackListView()
                    .tag(Tab.list)
                    .tabItem {
                        Label("Tracks", systemImage: "list.bullet")
                    }

                FavoriteListView()
                    .tag(Tab.faves)
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
            }
        }
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
