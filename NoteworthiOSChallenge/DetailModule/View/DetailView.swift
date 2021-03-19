//
//  DetailView.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

class DetailView: UIViewController {
    let presenter: DetailPresenter
    
    required init(presenter: DetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Properties
    var postImage: UIImageView!
    var authorLabel: UILabel!
    var titleLabel: UILabel!
    
    override func viewDidLoad() {
        setViewProperties()
        addSubviewsAndConstraints()
    }
    
    func setViewProperties() {
        self.authorLabel = {
            let label = UILabel ()
            label.text = self.presenter.post.value.author
            return label
        }()
        
        self.titleLabel = {
            let label = UILabel ()
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 0
            label.text = self.presenter.post.value.title
            label.sizeToFit()
            return label
        }()
        
        self.postImage = UIImageView()
        self.postImage.image = self.presenter.post.value.image
    }
    
    func addSubviewsAndConstraints() {
        [authorLabel, titleLabel, postImage]
            .forEach {
                guard let view = $0 else { return }
                self.view.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        
        self.authorLabel.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.postImage.topAnchor, trailing: nil, padding: .init(top: 10, left: 10, bottom: 10, right: 0))
        
        self.postImage.anchor(top: self.authorLabel.bottomAnchor, leading: nil, bottom: self.titleLabel.topAnchor, trailing: nil, padding: .init(top: 10, left: 0, bottom: 10, right: 0), size: .init(width: 200, height: 200))
        self.postImage.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        self.titleLabel.anchor(top: self.postImage.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 50, bottom: 10, right: 50))
        self.titleLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
}
