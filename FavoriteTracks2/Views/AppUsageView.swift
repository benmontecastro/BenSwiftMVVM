//
//  AppUsageView.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import SwiftUI

struct AppUsageView: View {
    let dateFormatter: DateFormatter = DateFormatter()
    
    /// Private properties that causes view refresh
    @State var dateOfLastVisit: Date = Persistence().getDateOfLastVisit() ?? Date()
    
    init() {
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
    }
    
    var body: some View {
        Text("Last Visit: " + dateFormatter.string(from: dateOfLastVisit))
            .font(.footnote)
            .onAppear {
                Persistence().saveDateOfLastVisit(date: Date())
            }
    }
}

struct AppUsageView_Previews: PreviewProvider {
    static var previews: some View {
        AppUsageView()
    }
}
