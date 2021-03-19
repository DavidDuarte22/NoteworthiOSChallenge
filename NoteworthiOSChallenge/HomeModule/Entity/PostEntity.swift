//
//  PostEntity.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

//- Title (at its full length, so take this into account when sizing your cells)
//- Author
//- entry date, following a format like “x hours ago”
//- A thumbnail for those who have a picture.
//- Number of comments
//- Unread status

/// TODO: Review desition!  Struct changed to class (reference type) for update the image once has been dowloaded
class PostEntity: Codable {
    
    let title: String
    let author: String
    let entryDate: Int //TODO: Logic to get hours 
    let thumbnail: String
    let numberComments: Int //num_comments
    var visited: Bool
    
    var image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case title, author, thumbnail, visited
        case entryDate = "created"
        case numberComments = "num_comments"
    }
    
    func loadImage(image: UIImage) {
        self.image = image
    }
}
