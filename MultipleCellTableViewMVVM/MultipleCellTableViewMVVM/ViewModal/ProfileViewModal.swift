//
//  ProfileViewModal.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation

class ProfileViewModal: NSObject {
    
    //This represent the Array of section in tableView
    var items: [ProfileViewModelItem] = [ProfileViewModelItem]()
    
    override init() {
        super.init()
        
        guard let data = dataFromFile("ServerJson"), let profile = Profile(data: data) else {
            return
        }
        
        if let name = profile.fullName, let imageUrl = profile.imageUrl {
            let nameAndPicture = ProfileViewModalName(profileUrl: imageUrl, userName: name)
            items.append(nameAndPicture)
        }
        
        if let about = profile.about {
            let about = ProfileViewModalAbout(about: about)
            items.append(about)
        }
        
        if let email = profile.email {
            let email = ProfileViewModalEmail(email: email)
            items.append(email)
        }
        
        let attributes = profile.profileAttribute
        if !attributes.isEmpty{
            let attributesItem = ProfileViewModalAttribute(attributes: attributes)
            items.append(attributesItem)
        }
        
        let friends = profile.friends
        if !friends.isEmpty {
            let friendsItem = ProfileViewModalFriends(friends: friends)
            items.append(friendsItem)
        }
        
    }
}
