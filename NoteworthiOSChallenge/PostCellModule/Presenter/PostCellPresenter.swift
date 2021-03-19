//
//  PostCellPresenter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol PostCellPresenterInterface {
    var post: Observable<PostEntity> { get set }
}

class PostCellPresenter: PostCellPresenterInterface {
    
    var postCellRouter: PostCellRouterInterface?
    var postCellInteractor: PostCellInteractorInterface?
    
    var post: Observable<PostEntity>
    
    init(post: PostEntity) {
        self.post = Observable<PostEntity>(post)
    }
}
