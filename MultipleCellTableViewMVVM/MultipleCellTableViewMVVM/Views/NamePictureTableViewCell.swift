//
//  NamePictureTableViewCell.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import UIKit

class NamePictureTableViewCell: UITableViewCell {

    let profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.layer.borderWidth = 1.0
        image.layer.borderColor = UIColor.systemGreen.cgColor
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .black
        return label
    }()
    
    let container: UIView = {
           let view = UIView()
           view.backgroundColor = .red
           return view
       }()
    
    var nameAndPicture: ProfileViewModelItem? {
        didSet {
            guard let item = nameAndPicture as? ProfileViewModalName else { return }
            nameLabel.text = item.userName
            profileImage.image = #imageLiteral(resourceName: "iron.jpeg")
            
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

    private func setupConstraints() {
        
        profileImage.anchor(nil, left: self.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 80)
        addConstraint(NSLayoutConstraint(item: profileImage, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self, attribute: .height, multiplier: 1, constant: 0))
        
        nameLabel.anchor(nil, left: self.profileImage.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 25)
        nameLabel.anchorCenterYToSuperview()
    }
}
