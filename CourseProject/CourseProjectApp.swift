//
//  CourseProjectApp.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 19.11.2023.
//

import SwiftUI

@main
struct CourseProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
