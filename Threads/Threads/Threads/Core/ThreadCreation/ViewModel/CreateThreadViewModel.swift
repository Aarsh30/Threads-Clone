//
//  CreateThreadViewModel.swift
//  Threads
//
//  Created by Aarsh  Patel on 08/02/24.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject{
//    @Published var caption = ""
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
