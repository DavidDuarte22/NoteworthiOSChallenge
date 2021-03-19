//
//  NetworkManager.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let session = URLSession(configuration: URLSessionConfiguration.default)

    private init() {
        
    }
    
    func fetchDataFromService(url: URL,  completion: @escaping (Data) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else { return }
            guard let data = data else { return }
            completion(data)
        }
        task.resume()
    }
    
    func downloadImage(from url: URL, completion: @escaping (Data) -> Void) {
        self.fetchDataFromService(url: url) { result in
            completion(result)
        }
    }
    
    func mapJsonToObject<T: Codable>(data: Data) -> T? {
        let decoder = JSONDecoder()
        guard let response = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        return response
    }
}
