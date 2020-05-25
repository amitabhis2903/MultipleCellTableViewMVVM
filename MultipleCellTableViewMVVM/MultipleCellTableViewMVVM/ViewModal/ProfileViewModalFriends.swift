//
//  ProfileViewModalFriends.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation

class ProfileViewModalFriends: ProfileViewModelItem {
    
    var type: ProfileViewModelItemType {
        return .friend
    }
    
    var sectionTitle: String {
        return "Friends"
    }
    
    var rowCount: Int {
        return friends.count
    }
    
    var friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
}
