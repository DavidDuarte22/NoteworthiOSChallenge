//
//  HomePresenter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol HomePresenterInterface {
    func getPostCell() -> UITableViewCell

}

class HomePresenter: HomePresenterInterface {

    var homeRouter: HomeRouterInterface?
    var homeInteractor: HomeInteractorInterface?
    
    // MARK: View Properties
    var tableView: UITableView!
    var dismissButton: UIButton!
    
    func getPostCell() -> UITableViewCell {
        let cell = PostCellModule.build()
        return cell
    }
}
