//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    var userNameCharCount: String {
        user.name.count.formatted()
    }
    
    private let storageManager = StorageManager.shared
    
    init(user: User = User()) {
        self.user = user
    }
    
    func login() {
        user.isLoggedIn.toggle()
        storageManager.save(user: user)
    }
    
    func logOut() {
        user.name = ""
        user.isLoggedIn.toggle()
        storageManager.clear()
    }
}
