//
//  PostCellModule.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

class PostCellModule {
    // TODO: Fix dependency injection
    static func build() -> UITableViewCell {
        
        let presenter = PostCellPresenter()
        let view = PostCell(presenter: presenter)
        let router = PostCellRouter()
        let interactor = PostCellInteractor()
        
        presenter.postCellRouter = router
        presenter.postCellInteractor = interactor
        
        return view
    }
}
