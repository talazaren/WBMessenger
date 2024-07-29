//
//  AsyncImageLoading.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/29/24.
//

import Foundation

enum Link: String {
    case url = "https://api.thecatapi.com/v1/images/search"
}

final class CatImageFetcher: ObservableObject {
    func fetchCatImage(completion: @escaping (String?) -> Void) {
        guard let url = URL(string: Link.url.rawValue) else {
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
                    completion(imageUrlString)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}
