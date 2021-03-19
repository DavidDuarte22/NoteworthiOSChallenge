//
//  HomeRouter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol HomeRouterInterface {
    func navigateToDetail(post: PostEntity)
}

class HomeRouter: HomeRouterInterface {
    
    weak var viewController: UIViewController?
    
    func navigateToDetail(post: PostEntity) {
        viewController?.navigationController?.pushViewController(DetailModule.build(post: post), animated: false)
    }
}
