//
//  UseCases.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 15.01.2024.
//

import Foundation
import SwiftUI

struct UseCases: Repository {
    var repo: Repository
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        repo.login(username: username, password: password, completion: completion)
    }
    
    func getMeInfo(completion: @escaping (UserModel?) -> Void) {
        repo.getMeInfo(completion: completion)
    }
    
    func getMyReciepts(completion: @escaping (RecipeNetworkModels?) -> Void) {
        repo.getMyReciepts(completion: completion)
    }
    
    func addRecipe(name: String, method: String, products: String, image: String) {
        repo.addRecipe(name: name, method: method, products: products, image: image)
    }
    
    func deleteRecipe(id: Int) {
        repo.deleteRecipe(id: id)
    }
    
    func deleteAdminRecipe(id: Int) {
        repo.deleteAdminRecipe(id: id)
    }
    
    func approveUser(id: Int) {
        repo.approveUser(id: id)
    }
    
    func register(login: String, name: String, surname: String, password: String, info: String) {
        repo.register(login: login, name: name, surname: surname, password: password, info: info)
    }
    
    func getAllReciepts(completion: @escaping (RecipeNetworkModels?) -> Void) {
        repo.getAllReciepts(completion: completion)
    }
    
    func getNewUsers(completion: @escaping ([UserModel]) -> Void) {
        repo.getNewUsers(completion: completion)
    }
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        repo.loadImage(from: urlString, completion: completion)
    }
    
    func getMyRecieptModel(completion: @escaping ([RecieptModel]) -> Void) {
        repo.getMyRecieptModel(completion: completion)
    }
    
    func getRecieptModel(completion: @escaping ([RecieptModel]) -> Void) {
        repo.getRecieptModel(completion: completion)
    }
}
