//
//  PostCellInteractor.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol PostCellInteractorInterface {
    func fetchPostPhoto(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void)
}

class PostCellInteractor: PostCellInteractorInterface {
  
    let networkManager = NetworkManager.shared
    
    func fetchPostPhoto(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        networkManager.downloadImage(from: url) { result in
            guard let image = UIImage(data: result) else {
                completion(.failure(CustomError.malformedError))
                return
            }
            completion(.success(image))
        }
    }
}


