//
//  ProfieViewModalEmail.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation

class ProfileViewModalEmail: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .email
    }
    
    var sectionTitle: String {
        return "Email"
    }
    
    var email: String?
    
    init(email: String) {
        self.email = email
    }
}
