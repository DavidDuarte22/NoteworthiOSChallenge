//
//  DetailPresenter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import Foundation

protocol DetailPresenterInterface {
    var post: PostEntity {get set}
}

class DetailPresenter: DetailPresenterInterface {
    var post: PostEntity
    
    var detailRouter: DetailRouterInterface?
    var detailInteractor: DetailInteractorInterface?
    
    init(post: PostEntity) {
        self.post = post
    }
}
