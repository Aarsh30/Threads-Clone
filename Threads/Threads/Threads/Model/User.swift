//
//  User.swift
//  Threads
//
//  Created by Aarsh  Patel on 06/02/24.
//

import Foundation

struct User: Identifiable, Codable , Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
    
    
    
}
