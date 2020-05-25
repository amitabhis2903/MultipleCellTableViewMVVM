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
        // Do any additional setup after loading the view.
    }
    
    private func setupTableViewConstraints() {
        view.addSubview(homeTableView)
        homeTableView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = "MVVM"
        return cell!
        
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
