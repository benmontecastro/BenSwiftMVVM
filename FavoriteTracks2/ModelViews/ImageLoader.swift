//
//  ImageLoader.swift
//  FavoriteTracks2
//
//  Created by Ben Montecastro on 21/9/21.
//

import UIKit

/// Image loading helper with Observable protocol so can be shared across multiple views
class ImageLoader: ObservableObject {
    //
    // MARK: - Variables And Properties
    //
    /// Published wrapper to cause change notification
    @Published var image: UIImage = UIImage()
    
    //
    // MARK: - Internal Methods
    //
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        
        task.resume()
    }
}
