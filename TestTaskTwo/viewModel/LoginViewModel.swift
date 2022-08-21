//
//  LoginViewModel.swift
//  TestTaskTwo
//
//  Created by admin on 21.08.2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var error: ErrorResponse? = nil
    @Published var isLogging: Bool = false
    
    func login() {
        error = nil
        isLogging = true
        UserService.sharedInstance.authenticate(username: username, password: password, errorCallback: { error in
            self.error = error
            self.isLogging = false
        }, successCallback: {
            self.isLogging = false
        })
    }
}
