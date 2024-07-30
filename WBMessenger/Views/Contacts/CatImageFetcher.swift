//
//  AsyncImageLoading.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/29/24.
//

import Foundation

enum ImageLink: String {
    case imageUrl = "https://api.thecatapi.com/v1/images/search"
}

final class CatImageFetcher: ObservableObject {
    func fetchCatImage(completion: @escaping (String?) -> Void) { 
        guard let url = URL(string: ImageLink.imageUrl.rawValue) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]],
                   let firstResult = json.first,
                   let imageUrlString = firstResult["url"] as? String {
                    print("Fetched URL: \(imageUrlString)")
                    completion(imageUrlString)
                } else {
                    print("Failed to parse JSON or URL not found")
                    completion(nil)
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }
}
