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
    
    var postsObservable: Observable<[PostEntity]?> { get set }
}

class HomePresenter: HomePresenterInterface {

    var homeRouter: HomeRouterInterface?
    var homeInteractor: HomeInteractorInterface?
    
    var postsObservable: Observable<[PostEntity]?> = Observable<[PostEntity]?>(nil)

    func getPosts() {
        let posts = [   PostEntity(title: "Man1 trying to return a dog's toy gets tricked into playing fetch", author: "washedupwornout", entryDate: 1411975314, thumbnail: "http://b.thumbs.redditmedia.com/9N1f7UGKM5fPZydrsgbb4_SUyyLW7A27um1VOygY3LM.jpg", numberComments: 958, visited: false),
                      PostEntity(title: "Man2 trying to return a dog's toy gets tricked into playing fetch", author: "washedupwornout", entryDate: 1411975314, thumbnail: "http://b.thumbs.redditmedia.com/9N1f7UGKM5fPZydrsgbb4_SUyyLW7A27um1VOygY3LM.jpg", numberComments: 958, visited: false),
                      PostEntity(title: "Man3 Man trying to return a dog's toy gets tricked into playing fetch", author: "washedupwornout", entryDate: 1411975314, thumbnail: "http://b.thumbs.redditmedia.com/9N1f7UGKM5fPZydrsgbb4_SUyyLW7A27um1VOygY3LM.jpg", numberComments: 958, visited: false)]
        
        self.postsObservable.value = posts
    }
    
    func getPostCell(post: PostEntity) -> UITableViewCell {
        let cell = PostCellModule.build(post: post)
        return cell
    }
}
