//
//  Persistence.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import Foundation

/// UserDefaults get/set helper
class Persistence {
    //
    // MARK: - Variables And Properties
    //
    var userDefaults: UserDefaults
    var searchString: String? = ""
    var isFavoritesOnly: Bool? = false
    
    //
    // MARK: - Initialization
    //
    init() {
        self.userDefaults = UserDefaults.standard
    }
    
    //
    // MARK: - Internal Methods
    //
    func getDateOfLastVisit() -> Date? {
        return userDefaults.object(forKey: "DateOfLastVisit") as? Date ?? Date()
    }
    
    func saveDateOfLastVisit(date: Date) {
        userDefaults.set(date, forKey: "DateOfLastVisit")
    }
    
    func getFavoriteTracks() -> [Int]? {
        return userDefaults.object(forKey: "Favorites") as? [Int] ?? []
    }
    
    func saveFavoriteTracks(favorites: [Int]) {
        userDefaults.set(favorites, forKey: "Favorites")
    }
    
    func getShowFavorites() -> Bool? {
        return userDefaults.object(forKey: "ShowFavorites") as? Bool ?? false
    }
    
    func saveShowFavorites(show: Bool) {
        userDefaults.set(show, forKey: "ShowFavorites")
    }
    
    func getSearchText() -> String? {
        return userDefaults.object(forKey: "SearchText") as? String ?? ""
    }
    
    func saveSearchText(text: String) {
        userDefaults.set(text, forKey: "SearchText")
    }

}
