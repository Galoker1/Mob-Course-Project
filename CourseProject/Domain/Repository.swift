//
//  Repository.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 15.01.2024.
//

import Foundation
import SwiftUI

protocol Repository {
    func login(username: String, password: String, completion: @escaping (Bool) -> Void)
    func getMeInfo(completion: @escaping (UserModel?) -> Void)
    func getMyReciepts(completion: @escaping (RecipeNetworkModels?) -> Void)
    func addRecipe(
        name: String,
        method: String,
        products: String,
        image: String
    )
    func deleteRecipe(id: Int)
    func deleteAdminRecipe(id: Int)
    func approveUser(id: Int)
    func register(
        login: String,
        name: String,
        surname: String,
        password: String,
        info: String
    )
    func getAllReciepts(completion: @escaping (RecipeNetworkModels?) -> Void)
    func getNewUsers(completion: @escaping ([UserModel]) -> Void)
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
    func getMyRecieptModel(completion: @escaping ([RecieptModel]) -> Void)
    func getRecieptModel(completion: @escaping ([RecieptModel]) -> Void)
}
