//
//  ProfileViewModal.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation

class ProfileViewModalName: ProfileViewModelItem {
    
    var type: ProfileViewModelItemType {
        return .nameAndPicture
    }
    
    var sectionTitle: String {
        return "Main Info"
    }
    
    var profileUrl: String?
    var userName: String?
    
    init(profileUrl: String, userName: String) {
        self.profileUrl = profileUrl
        self.userName = userName
    }
}
