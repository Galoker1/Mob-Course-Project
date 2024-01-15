//
//  Network.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 19.11.2023.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {
        
    }

    func login(username: String, password: String, completion: @escaping (Bool) -> Void){
        var result = false
            if let url = URL(string: "http://localhost:8080/login?username=\(username)&password=\(password)") {
                        // Создаем URLRequest с URL
                        var request = URLRequest(url: url)
                        request.httpMethod = "POST" // Устанавливаем метод запроса
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Устанавливаем заголовок Content-Type

                        // Создаем URLSession
                        let session = URLSession.shared
                        
                        // Создаем задачу URLSession
                        let task = session.dataTask(with: request) { (data, response, error) in
                            if let data = data {
                                if String(data: data, encoding: .utf8) == "true" {
                                    completion(true)
                                }
                                else {
                                    completion(false)
                                }
                            }

        
                        }
                        
                        // Начинаем выполнение запроса
                        task.resume()
            }
    }
    
    func getMeInfo(completion: @escaping (UserModel?) -> Void) {
        if let url = URL(string: "http://localhost:8080/me") {
                    // Создаем URLRequest с URL
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET" // Устанавливаем метод запроса
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Устанавливаем заголовок Content-Type

                    // Создаем URLSession
                    let session = URLSession.shared
                    
                    // Создаем задачу URLSession
                    let task = session.dataTask(with: request) { (data, response, error) in
                        if let data = data {
                            do {
                                let user = try JSONDecoder().decode(UserModel.self, from: data)
                                completion(user)
                            } catch {
                                completion(nil)
                            }
                        }

    
                    }
                    
                    // Начинаем выполнение запроса
                    task.resume()
        }
    }
    
    func getMyReciepts(completion: @escaping (RecipeNetworkModels?) -> Void) {
        if let url = URL(string: "http://localhost:8080/me/myRecipes") {
                    // Создаем URLRequest с URL
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET" // Устанавливаем метод запроса
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Устанавливаем заголовок Content-Type

                    // Создаем URLSession
                    let session = URLSession.shared
                    
                    // Создаем задачу URLSession
                    let task = session.dataTask(with: request) { (data, response, error) in
                        if let data = data {
                            do {
                                let recipes = try JSONDecoder().decode(RecipeNetworkModels.self, from: data)
                                completion(recipes)
                            } catch {
                                completion(nil)
                            }
                        }

    
                    }
                    
                    // Начинаем выполнение запроса
                    task.resume()
        }
    }
    
    func createRecipe(
        name: String,
        method: String,
        products: String,
        image: String
    ) {
        if let url = URL(string: "http://localhost:8080/recipe/create") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let recipeData: [String: Any] = [
                "name": name,
                "product": products,
                "cookingMethod": method,
                "linkToPicture": image
            ]
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: recipeData)
                print(request.httpBody)
            } catch {
                print("Error encoding recipe data: \(error)")
                return
            }

            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let recipes = try JSONDecoder().decode(RecipeNetworkModels.self, from: data)
                    } catch {
                        print("Error decoding recipe data: \(error)")
                    }
                } else if let error = error {
                    print("Error making network request: \(error)")
                }
            }

            task.resume()
        } else {
            print("Invalid URL")
        }
    }
    
    func addRecipe(
        name: String,
        method: String,
        products: String,
        image: String
    ) {
            
            let urlStr = "http://localhost:8080/recipe/create"
            
            guard let url = URL(string: urlStr) else {
                print("Invalid URL: \(urlStr)")
                return
            }
            let queryItems = [
                URLQueryItem(name: "name", value: name),
                URLQueryItem(name: "product", value: method),
                URLQueryItem(name: "cookingMethod", value: method),
                URLQueryItem(name: "linkToPicture", value: image)
            ]
            var urlComponents = URLComponents(string: urlStr)
            urlComponents?.queryItems = queryItems
            
            guard let url = urlComponents?.url else {
                print("Invalid URL")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            
            
            
            let session = URLSession.shared
            print("+++++++URL: \(request)")
            
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Ошибка: \(error.localizedDescription)")
                    return
                }
                
                // Обработка данных и ответа здесь
                if let data = data {
                    do{
                        print(String(data: data, encoding: .utf8))
                    } catch {
                        print("fail")
                    }
                }
            }
            task.resume()
        }

    func deleteRecipe(id: Int) {
        let urlStr = "http://localhost:8080/recipe/\(id)/delete"
        
        guard let url = URL(string: urlStr) else {
            print("Invalid URL: \(urlStr)")
            return
        }
        var urlComponents = URLComponents(string: urlStr)

        
        guard let url = urlComponents?.url else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        
        
        
        let session = URLSession.shared
        print("+++++++URL: \(request)")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            // Обработка данных и ответа здесь
            if let data = data {
                do{
                    print(String(data: data, encoding: .utf8))
                } catch {
                    print("fail")
                }
            }
        }
        task.resume()
    }
    
    func deleteAdminRecipe(id: Int) {
        let urlStr = "http://localhost:8080/admin/recipe/\(id)/delete"
        
        guard let url = URL(string: urlStr) else {
            print("Invalid URL: \(urlStr)")
            return
        }
        var urlComponents = URLComponents(string: urlStr)

        
        guard let url = urlComponents?.url else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        
        
        
        let session = URLSession.shared
        print("+++++++URL: \(request)")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            // Обработка данных и ответа здесь
            if let data = data {
                do{
                    print(String(data: data, encoding: .utf8))
                } catch {
                    print("fail")
                }
            }
        }
        task.resume()
    }
    func approveUser(id: Int) {
        let urlStr = "http://localhost:8080/admin/newNonApprovedUsers/\(id)/approved/true"
        
        guard let url = URL(string: urlStr) else {
            print("Invalid URL: \(urlStr)")
            return
        }
        var urlComponents = URLComponents(string: urlStr)

        
        guard let url = urlComponents?.url else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        
        
        
        let session = URLSession.shared
        print("+++++++URL: \(request)")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            // Обработка данных и ответа здесь
            if let data = data {
                do{
                    print(String(data: data, encoding: .utf8))
                } catch {
                    print("fail")
                }
            }
        }
        task.resume()
    }
    func register(
        login: String,
        name: String,
        surname: String,
        password: String,
        info: String
    ) {
        let urlStr = "http://localhost:8080/registration"
        
        guard let url = URL(string: urlStr) else {
            print("Invalid URL: \(urlStr)")
            return
        }
        
        let queryItems = [
            URLQueryItem(name: "username", value: name),
            URLQueryItem(name: "password", value: password),
            URLQueryItem(name: "name", value: name),
            URLQueryItem(name: "surname", value: surname),
            URLQueryItem(name: "information", value: info)
        ]
        
        var urlComponents = URLComponents(string: urlStr)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        
        
        let session = URLSession.shared
        print("+++++++URL: \(request)")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            // Обработка данных и ответа здесь
            if let data = data {
                do{
                    print(String(data: data, encoding: .utf8))
                } catch {
                    print("fail")
                }
            }
        }
        task.resume()
    }
    
    func getAllReciepts(completion: @escaping (RecipeNetworkModels?) -> Void) {
        if let url = URL(string: "http://localhost:8080/recipe") {
                    // Создаем URLRequest с URL
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET" // Устанавливаем метод запроса
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Устанавливаем заголовок Content-Type

                    // Создаем URLSession
                    let session = URLSession.shared
                    
                    // Создаем задачу URLSession
                    let task = session.dataTask(with: request) { (data, response, error) in
                        if let data = data {
                            do {
                                let recipes = try JSONDecoder().decode(RecipeNetworkModels.self, from: data)
                                completion(recipes)
                            } catch {
                                completion(nil)
                            }
                        }

    
                    }
                    
                    // Начинаем выполнение запроса
                    task.resume()
        }
    }
    
    func getNewUsers(completion: @escaping ([UserModel]) -> Void) {
        if let url = URL(string: "http://localhost:8080/admin/newNonApprovedUsers") {
                    // Создаем URLRequest с URL
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET" // Устанавливаем метод запроса
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Устанавливаем заголовок Content-Type

                    // Создаем URLSession
                    let session = URLSession.shared
                    
                    // Создаем задачу URLSession
                    let task = session.dataTask(with: request) { (data, response, error) in
                        if let data = data {
                            do {
                                let recipes = try JSONDecoder().decode([UserModel].self, from: data)
                                completion(recipes)
                            } catch {
                                completion([])
                            }
                        }

    
                    }
                    
                    // Начинаем выполнение запроса
                    task.resume()
        }
    }

    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }

            if let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
    func getMyRecieptModel(completion: @escaping ([RecieptModel]) -> Void) {
        var result:[RecieptModel]  = []
        getMyReciepts{ models in
            for model in models ?? [] {
                let newModel = RecieptModel(id: model.id,
                                            name: model.name,
                                            product: model.product,
                                            cookingMethod: model.cookingMethod,
                                            link: model.linkToPicture,
                                            picture: nil,
                                            authorID: model.author.id,
                                            authorUsername: model.author.username)
                result.append(newModel)
            }
            completion(result)
        }
    }
    func getRecieptModel(completion: @escaping ([RecieptModel]) -> Void) {
        var result:[RecieptModel]  = []
        getAllReciepts{ models in
            for model in models ?? [] {
                let newModel = RecieptModel(id: model.id,
                                            name: model.name,
                                            product: model.product,
                                            cookingMethod: model.cookingMethod,
                                            link: model.linkToPicture,
                                            picture: nil,
                                            authorID: model.author.id,
                                            authorUsername: model.author.username)
                result.append(newModel)
            }
            completion(result)
        }
    }
    
}

