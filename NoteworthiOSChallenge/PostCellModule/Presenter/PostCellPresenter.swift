//
//  PostCellPresenter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol PostCellPresenterInterface {
    func getPostImage(from url: URL)
    var post: Observable<PostEntity> { get set }
}

class PostCellPresenter: PostCellPresenterInterface {
    
    var postCellRouter: PostCellRouterInterface?
    var postCellInteractor: PostCellInteractorInterface?
    
    var post: Observable<PostEntity>
    
    init(post: PostEntity) {
        self.post = Observable<PostEntity>(post)
    }
    
    func getPostImage(from url: URL) {
        
        postCellInteractor?.fetchPostPhoto(from: url) { result in
            switch result {
            case .success(let image):
                self.post.value.image = image
            case .failure(let error):
                print(error)
                //response = Result.failure(error)
            }
        }
    }
}
