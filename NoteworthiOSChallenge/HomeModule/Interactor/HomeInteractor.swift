//
//  HomeInteractor.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol HomeInteractorInterface {
    func fetchPosts(completion: @escaping (Result<[PostEntity], Error>) -> Void)
}

class HomeInteractor: HomeInteractorInterface {
  
    let networkManager = NetworkManager.shared
    
    func fetchPosts(completion: @escaping (Result<[PostEntity], Error>) -> Void) {
        guard let url = URL(string: "https://www.reddit.com/r/all/top/.json?t=all&limit=10") else {
            return
            // TODO: completion failure invalid url
        }
        networkManager.fetchDataFromService(url: url) { [unowned self] result in
            let res: JsonResponseEntity? = self.networkManager.mapJsonToObject(data: result)
            guard let postsData = res?.data.children else { return }
            var posts: [PostEntity] = []
            postsData.forEach{ posts.append($0.data) }
            completion(.success(posts))
        }
    }
}
