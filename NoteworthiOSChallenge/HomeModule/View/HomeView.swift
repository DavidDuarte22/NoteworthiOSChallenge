//
//  HomeView.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import UIKit

class HomeView: UIViewController {
    
    let presenter: HomePresenterInterface
    
    required init(presenter: HomePresenterInterface) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setViewProperties()
        addSubviewsAndConstraints()
    }
    
    // MARK: View Properties
    var tableView: UITableView!
    var dismissButton: UIButton!
    private let refreshControl = UIRefreshControl()
    
    func setViewProperties() {
        self.dismissButton = {
            let button = UIButton()
            button.backgroundColor = .clear
            button.setTitle("Dismiss All", for: .normal)
            button.setTitleColor(.orange, for: .normal)
            return button
        }()
        
        self.tableView = {
            let tableView = UITableView()
            return tableView
        }()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func addSubviewsAndConstraints() {
        [tableView, dismissButton]
            .forEach {
                guard let view = $0 else { return }
                self.view.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        
        self.tableView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.dismissButton.topAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        self.dismissButton.anchor(top: nil, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
    }
    
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.presenter.getPostCell() as! PostCell
        return cell
    }
}
