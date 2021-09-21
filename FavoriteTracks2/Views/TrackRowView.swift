//
//  TrackRowView.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import SwiftUI
import Combine

struct TrackRowView: View {
    @ObservedObject var track: Track
    
    /// Shared within the app
    @EnvironmentObject var favorites: Favorites

    var body: some View {
        HStack {
            TrackImageView(urlString: track.imageUrl.absoluteString)

            VStack {
                HStack {
                    Text("\(track.trackName)")

                    Spacer()
                    
                    if favorites.contains(track) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.green)
                    }
                }
                HStack {
                    Text("\(track.genre)")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text("\(track.currency) \(track.price, specifier: "%0.2f")")
                        .font(.subheadline)
                }
            }
        }
    }
}

#if DEBUG
struct TrackRowView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        let track = model.tracks[0]
        TrackRowView(track: track)
            .environmentObject(model)
    }
}
#endif
