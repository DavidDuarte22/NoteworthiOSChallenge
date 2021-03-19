//
//  HomePresenter.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol HomePresenterInterface {
    func getPosts()
    func getPostCell(post: PostEntity) -> UITableViewCell
    func getPostDetail(post: PostEntity)
    
    var postsObservable: Observable<[PostEntity]?> { get set }
}

class HomePresenter: HomePresenterInterface {

    var homeRouter: HomeRouterInterface?
    var homeInteractor: HomeInteractorInterface?
    
    var postsObservable: Observable<[PostEntity]?> = Observable<[PostEntity]?>(nil)

    func getPosts() {
        homeInteractor?.fetchPosts() { [unowned self] result in
            switch result {
            case .success(let dataPosts):
                self.postsObservable.value = dataPosts
            case .failure(let error):
                print(error)
                /// TODO: Router show error.
                // homeRouter.showError(message: error.localizedDescription)
            }
        }
    }
    
    func getPostCell(post: PostEntity) -> UITableViewCell {
        let cell = PostCellModule.build(post: post)
        return cell
    }
    
    func getPostDetail(post: PostEntity) {
        self.homeRouter?.navigateToDetail(post: post)
    }
}
