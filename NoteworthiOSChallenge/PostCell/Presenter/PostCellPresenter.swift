//
//  PostCellPresenter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol PostCellPresenterInterface {
    
}

class PostCellPresenter: PostCellPresenterInterface {
    
    var postCellRouter: PostCellRouterInterface?
    var postCellInteractor: PostCellInteractorInterface?
}
