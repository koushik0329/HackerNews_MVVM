//
//  LoginViewModel.swift
//  HackerNews_MVVM
//
//  Created by Koushik Reddy Kambham on 9/4/25.
//

import Foundation

class LoginViewModel {
    var credentials = User(email: "", password: "")
    
    func validateLoginEmail(email: String?) -> Bool {
        guard let email = email, email.contains("@gmail"), email.count > 10 else {
            print("Email is invlaid")
            return false
        }
        return true
    }
    
    func validateLoginPassword(password: String?) -> Bool {
        guard let password = password, password.count > 6 else {
            print("Password is invalid")
            return false
        }
        return true
    }
    
    
}
