//
//  ProfileModal.swift
//  MultipleCellTableViewMVVM
//
//  Created by Amitabh Pandey on 25/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation

class Profile {
    var fullName: String?
    var imageUrl: String?
    var email: String?
    var about: String?
    var friends = [Friend]()
    var profileAttribute = [Attribute]()
    
    init?(data: Data) {
        do {
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any], let body = json["data"] as? [String: Any] {
                
                self.fullName = body["fullName"] as? String
                self.imageUrl = body["pictureUrl"] as? String
                self.email = body["email"] as? String
                self.about = body["about"] as? String
                
                
                if let friends = body["friends"] as? [[String: Any]] {
                    self.friends = friends.map { Friend(json: $0) }
                }
                
                if let attributes = body["profileAttributes"] as? [[String: Any]] {
                    self.profileAttribute = attributes.map { Attribute(json: $0)}
                }
            }
        }
    }
    
}


class Friend {
    var name: String?
    var imageUrl: String?
    
    init(json: [String: Any]) {
        self.name = json["name"] as? String
        self.imageUrl = json["pictureUrl"] as? String
    }
}

class Attribute {
    var key: String?
    var value: String?
    
    init(json: [String: Any]) {
        self.key = json["key"] as? String
        self.value = json["value"] as? String
    }
}
