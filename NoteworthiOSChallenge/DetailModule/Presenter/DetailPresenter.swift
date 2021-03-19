//
//  DetailPresenter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import Foundation

protocol DetailPresenterInterface {
    var post: Observable<PostEntity> { get set }
}

class DetailPresenter: DetailPresenterInterface {
    var post: Observable<PostEntity>

    var detailRouter: DetailRouterInterface?
    var detailInteractor: DetailInteractorInterface?
    
    init(post: PostEntity) {
        self.post = Observable<PostEntity>(post)
    }
}
