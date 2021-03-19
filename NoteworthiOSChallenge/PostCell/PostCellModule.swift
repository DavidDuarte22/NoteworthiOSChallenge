//
//  PostCellModule.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

class PostCellModule {
    // TODO: Fix dependency injection
    static func build(post: PostEntity) -> UITableViewCell {
        
        let presenter = PostCellPresenter(post: post)
        let router = PostCellRouter()
        let interactor = PostCellInteractor()
        
        presenter.postCellRouter = router
        presenter.postCellInteractor = interactor
        
        let view = PostCell(presenter: presenter)
        
        return view
    }
}
