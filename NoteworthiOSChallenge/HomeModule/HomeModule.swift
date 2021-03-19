//
//  HomeModule.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

class HomeModule {

    static func build() -> UIViewController {
        
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let view = HomeView(presenter: presenter)
        
        presenter.homeRouter = router
        presenter.homeInteractor = interactor
        router.viewController = view
        
        return view
    }
}
