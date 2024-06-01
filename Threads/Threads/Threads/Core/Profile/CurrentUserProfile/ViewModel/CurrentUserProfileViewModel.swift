//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Aarsh  Patel on 06/02/24.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI


class CurrentUserProfileViewModel: ObservableObject
{
    @Published var currentUser: User?
    
    
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
           // print("DEBUG: user in a view model from combine is \(user)")
        }.store(in: &cancellables)
    }
    
    
}
