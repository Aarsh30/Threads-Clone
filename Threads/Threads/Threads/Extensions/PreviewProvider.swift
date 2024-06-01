//
//  PreviewProvider.swift
//  Threads
//
//  Created by Aarsh  Patel on 06/02/24.
//

import SwiftUI
import Firebase

extension PreviewProvider{
    static var dev: DeveloperPreview {
        
        return DeveloperPreview.shared
    }
}


class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user =  User(id:NSUUID().uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "maxverstappen1")
    
    let thread = Thread(ownerUid: "123", caption: "this is a test thread", timestamp: Timestamp(), likes: 0)
}
