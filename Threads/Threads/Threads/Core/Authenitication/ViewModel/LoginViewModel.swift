//
//  LoginViewModel.swift
//  Threads
//
//  Created by Aarsh  Patel on 06/02/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published  var email = ""
    @Published  var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
    }
}

