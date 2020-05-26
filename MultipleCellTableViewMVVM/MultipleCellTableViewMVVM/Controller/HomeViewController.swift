//
//  HomeViewController.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var homeTableView = UITableView()
    fileprivate let viewModel = ProfileViewModal()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        homeTableView.dataSource = self
        setupTableViewConstraints()
        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        homeTableView.delegate = self
        registerCell()
        homeTableView.estimatedRowHeight = homeTableView.rowHeight
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.tableFooterView = UIView()
    }
    
    
    
    private func registerCell() {
        
        homeTableView.register(AboutTableViewCell.self, forCellReuseIdentifier: String(describing: AboutTableViewCell.self))
        homeTableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: String(describing: FriendsTableViewCell.self))
        homeTableView.register(EmailTableViewCell.self, forCellReuseIdentifier: String(describing: EmailTableViewCell.self))
        homeTableView.register(NamePictureTableViewCell.self, forCellReuseIdentifier: String(describing: NamePictureTableViewCell.self))
        
        
    }
    
    private func setupTableViewConstraints() {
        view.addSubview(homeTableView)
        homeTableView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

extension HomeViewController : UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel.items[indexPath.section]
        switch item.type {
            
        case .nameAndPicture:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NamePictureTableViewCell.self), for: indexPath) as? NamePictureTableViewCell {
                cell.nameAndPicture = item
                return cell
            }
        case .email:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EmailTableViewCell.self), for: indexPath) as? EmailTableViewCell {
                cell.emailItem = item
                return cell
            }
            
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AboutTableViewCell.self), for: indexPath) as? AboutTableViewCell {
                cell.aboutItem = item
                return cell
            }
            
        case .friend:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FriendsTableViewCell.self), for: indexPath) as? FriendsTableViewCell, let items = item as? ProfileViewModalFriends {
                let friend = items.friends[indexPath.row]
                cell.friends = friend
                return cell
            }
        case .attribute:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.items[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    
}
