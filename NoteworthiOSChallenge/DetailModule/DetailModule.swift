//
//  DetailModule.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

class DetailModule {

    static func build(post: PostEntity) -> UIViewController {
        
        let presenter = DetailPresenter(post: post)
        let router = DetailRouter()
        let interactor = DetailInteractor()
        let view = DetailView(presenter: presenter)
        
        presenter.detailRouter = router
        presenter.detailInteractor = interactor
        router.viewController = view
        
        return view
    }
}
