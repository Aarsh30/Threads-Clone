//
//  Thread.swift
//  Threads
//
//  Created by Aarsh  Patel on 08/02/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
//    let id: String
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String{
        return threadId ?? NSUUID().uuidString
    }
    var user: User?
    
}
