//
//  AuthService.swift
//  Threads
//
//  Created by Aarsh  Patel on 06/02/24.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService{
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init()
    {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws{
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            
            print("Debug: created user\(result.user.uid)")
        } catch {
            print("Debug fail to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws{
        
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            print("Debug: created user\(result.user.uid)")
        } catch {
            print("Debug fail to create user with error \(error.localizedDescription)")
        }
    }
    func signOut()
    {
        try? Auth.auth().signOut() //signs out on backend
        self.userSession = nil // this removes session locally and updates routing
        UserService.shared.reset() //set currents user object to nil
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String,fullname: String, username: String, id: String) async
    throws{
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData =  try? Firestore.Encoder().encode(user) else {
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
