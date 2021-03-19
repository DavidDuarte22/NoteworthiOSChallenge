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
    
    func fetchPosts(completion: @escaping (Result<[PostEntity], Error>) -> Void) {
        let posts = [   PostEntity(title: "Man1 trying to return a dog's toy gets tricked into playing fetch", author: "washedupwornout", entryDate: 1411975314, thumbnail: "http://b.thumbs.redditmedia.com/9N1f7UGKM5fPZydrsgbb4_SUyyLW7A27um1VOygY3LM.jpg", numberComments: 958, visited: false),
                      PostEntity(title: "Man2 trying to return a dog's toy gets tricked into playing fetch", author: "washedupwornout", entryDate: 1411975314, thumbnail: "http://b.thumbs.redditmedia.com/9N1f7UGKM5fPZydrsgbb4_SUyyLW7A27um1VOygY3LM.jpg", numberComments: 958, visited: false),
                      PostEntity(title: "Man3 Man trying to return a dog's toy gets tricked into playing fetch", author: "washedupwornout", entryDate: 1411975314, thumbnail: "http://b.thumbs.redditmedia.com/9N1f7UGKM5fPZydrsgbb4_SUyyLW7A27um1VOygY3LM.jpg", numberComments: 958, visited: false)]
        
            completion(.success(posts))
        
    }
}
