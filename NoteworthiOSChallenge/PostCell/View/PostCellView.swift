//
//  PostCellView.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

protocol PostCellDelegate:class {
    func cellTapped(row: Int)
    func navigateToDetail(row: Int)
}

class PostCell: UITableViewCell {
    
    let presenter: PostCellPresenterInterface
    weak var delegate: PostCellDelegate?

    init(presenter: PostCellPresenterInterface) {
        self.presenter = presenter
        super.init(style: .default, reuseIdentifier: nil)
        setViewProperties()
        addSubviewsAndConstraints()
        setupDelegateGestures()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Properties
    var unseenDot: UIImage!
    var authorLabel: UILabel!
    var createdTime: UILabel!
    var titleLabel: UILabel!
    var postImage: UIImageView!
    var dismissButton: UIButton!
    var dismissLabel: UILabel!
    var numComments: UILabel!
    var goDetailFrame: UILabel!
        
   
    // MARK: Setup Views
    func setViewProperties() {
        self.postImage = UIImageView()

        self.authorLabel = {
            let label = UILabel ()
            label.text = "washedupwornout"
            return label
        }()
        
        self.createdTime = {
            let label = UILabel ()
            label.text = "Created 9hs ago"
            return label
        }()
        
        self.titleLabel = {
            let label = UILabel ()
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 0
            label.text = "Man trying to return a dog's toy gets tricked into playing fetch"
            label.sizeToFit()
            return label
        }()
        
        self.dismissButton = {
            let button = UIButton()
            button.backgroundColor = .clear
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.orange.cgColor
            button.titleLabel?.font = .systemFont(ofSize: 14)
            button.setTitle("X", for: .normal)
            button.setTitleColor(.orange, for: .normal)
            return button
        }()
        
        self.dismissLabel = {
            let label = UILabel ()
            label.textColor = .orange
            label.text = "Dismiss button"
            return label
        }()
        
        self.numComments = {
            let label = UILabel ()
            label.textColor = .orange
            label.text = "2000 comments"
            return label
        }()
        
        self.goDetailFrame = {
            let label = UILabel ()
            label.textAlignment = .right
            label.text = ">"
            return label
        }()
    }
    
    // MARK: Constraints
    func addSubviewsAndConstraints() {
        [authorLabel, createdTime,
         titleLabel, postImage,
         dismissButton, dismissLabel, numComments,
         goDetailFrame]
            .forEach {
                guard let view = $0 else { return }
                self.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        
        self.authorLabel.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        self.createdTime.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.authorLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        
        self.postImage.anchor(top: nil, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.titleLabel.leadingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 10), size: .init(width: 70, height: 70))

        let postImageConstraint = self.postImage.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 10)
        postImageConstraint.priority = UILayoutPriority(rawValue: 700)
        postImageConstraint.isActive = true
        
        self.postImage.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        
        self.titleLabel.anchor(top: self.authorLabel.bottomAnchor, leading: self.postImage.trailingAnchor, bottom: self.dismissLabel.topAnchor, trailing: self.goDetailFrame.leadingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 0))
        
        self.dismissButton.anchor(top: self.titleLabel.bottomAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 10, left: 10, bottom: 10, right: 0))
        self.dismissLabel.anchor(top: self.titleLabel.bottomAnchor, leading: self.dismissButton.trailingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 10, left: 5, bottom: 10, right: 0))
        self.numComments.anchor(top: self.titleLabel.bottomAnchor, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 10, right: 10))
        
        self.goDetailFrame.anchor(top: nil, leading: nil, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        self.goDetailFrame.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

    }
    
    // MARK: Actions
    /// Using label gesture recognizer instead of tableview delegate for a better user experience
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        delegate?.navigateToDetail(row: self.tag)
    }
    
    @objc func dismissTapped(sender: UIButton) {
        delegate?.cellTapped(row: self.tag)
    }
    
    func setupDelegateGestures() {
        self.dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.titleLabel.isUserInteractionEnabled = true
        self.goDetailFrame.isUserInteractionEnabled = true
        self.titleLabel.addGestureRecognizer(labelTap)
        self.goDetailFrame.addGestureRecognizer(labelTap)
    }
}
