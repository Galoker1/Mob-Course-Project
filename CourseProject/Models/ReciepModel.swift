//
//  ReciepModel.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 26.11.2023.
//

import Foundation
import SwiftUI
class RecieptModel: ObservableObject {
    let id: Int
    let name,product, cookingMethod: String
    let link: String
    @Published var picture: UIImage?
    let authorID: Int
    let authorUsername: String
    
    init(id: Int, name: String, product: String, cookingMethod: String, link: String, picture: UIImage? = nil, authorID: Int, authorUsername: String) {
        self.id = id
        self.name = name
        self.product = product
        self.cookingMethod = cookingMethod
        self.link = link
        self.picture = picture
        self.authorID = authorID
        self.authorUsername = authorUsername
    }
}
