//
//  HomePresenter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol HomePresenterInterface {
    
}

class HomePresenter: HomePresenterInterface {

    var homeRouter: HomeRouterInterface?
    var homeInteractor: HomeInteractorInterface?
    
    // MARK: View Properties
    var tableView: UITableView!
    var dismissButton: UIButton!
}
