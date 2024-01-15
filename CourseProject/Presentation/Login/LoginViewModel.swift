//
//  LoginViewModel.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 19.11.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var showingAlert = false
    @Published var loggedIn = false
    @Published var textLogin = ""
    @Published var textPassword = ""
    init() {
        let defaults = UserDefaults.standard
        if let login = defaults.string(forKey: "login"),
           let password = defaults.string(forKey: "password") {
            self.login(textLogin: login, textPassword: password) { result in
                if result {
                    DispatchQueue.main.async {
                        self.loggedIn = true
                    }
                }
            }
        }
    }
    
    func login(textLogin: String, textPassword: String, completion: (@escaping (Bool) -> Void))  {
        NetworkManager.shared.login(username: textLogin, password: textPassword) { result in
              if result != true {
                  DispatchQueue.main.async {
                      self.showingAlert = true
                  }
                  completion(false)
            }
            else {
                let defaults = UserDefaults.standard
                defaults.set(textLogin, forKey: "login")
                defaults.set(textPassword, forKey: "password")
                DispatchQueue.main.async {
                    self.textPassword = ""
                    self.textLogin = ""                    
                }
                completion(true)
            }
        }
    }
}
