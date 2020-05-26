//
//  AboutTableViewCell.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    let aboutLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    var aboutItem: ProfileViewModelItem? {
        didSet {
            guard let item = aboutItem as? ProfileViewModalAbout else { return }
            aboutLabel.text = item.about
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   

    private func setupLabelConstraints() {
        addSubview(aboutLabel)
        aboutLabel.anchor(nil, left: self.leftAnchor, bottom: nil, right: self.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        addConstraint(NSLayoutConstraint(item: aboutLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
