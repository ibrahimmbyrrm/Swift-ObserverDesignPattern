//
//  LoginViewModel.swift
//  ObserverDesignPattern
//
//  Created by İbrahim Bayram on 9.05.2023.
//

import Foundation

final class LoginViewModel {
    
    var error : ObservableObject<String?> = ObservableObject(nil)
    
    func login(email : String, passsword : String) {
        NetworkService.shared.login(email: email, password: passsword) { [weak self] success in
            self?.error.value = success ? nil : "Invalid Credentials!!!"
        }
    }
}
