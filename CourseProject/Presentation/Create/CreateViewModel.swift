//
//  CreateViewModel.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 15.01.2024.
//

import Foundation

class CreateViewModel: ObservableObject {
    @Published var name = ""
    @Published var cookingMethod = ""
    @Published var products = ""
    @Published var linkToPicture = ""
    var useCases = UseCases(repo: NetworkManager.shared)
    
    init() {
    }
    

    
    
    func create() {
        useCases.addRecipe(name: name, method: cookingMethod, products: products, image: linkToPicture)
    }
}
