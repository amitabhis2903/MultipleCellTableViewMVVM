//
//  FriendsTableViewCell.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 26/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    let profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.layer.borderWidth = 1.0
        image.layer.borderColor = UIColor.systemGreen.cgColor
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    
    var friends: Friend? {
        didSet {
            guard let friends = friends else { return }
            profileImage.image = #imageLiteral(resourceName: "iron.jpeg")
            nameLabel.text = friends.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(profileImage)
        addSubview(nameLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    private func setupConstraints() {
        
        profileImage.anchor(nil, left: self.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        addConstraint(NSLayoutConstraint(item: profileImage, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self, attribute: .height, multiplier: 1, constant: 0))
        
        nameLabel.anchor(nil, left: self.profileImage.rightAnchor, bottom: nil, right: self.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 25)
        nameLabel.anchorCenterYToSuperview()
    }

}
