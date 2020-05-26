//
//  EmailTableViewCell.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import UIKit

class EmailTableViewCell: UITableViewCell {

    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    
   
    
    var emailItem: ProfileViewModelItem? {
        didSet {
            guard let item = emailItem as? ProfileViewModalEmail else { return }
            emailLabel.text = item.email
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
        addSubview(emailLabel)
        emailLabel.anchor(nil, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 20)
        addConstraint(NSLayoutConstraint(item: emailLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
