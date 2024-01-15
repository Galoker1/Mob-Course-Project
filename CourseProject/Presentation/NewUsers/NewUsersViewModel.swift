//
//  NewUsersViewModel.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 14.01.2024.
//

import Foundation

class NewUsersViewModel: ObservableObject {
  @Published var user: UserModel? = nil
  @Published var reloadView: Bool = false
  @Published var users: [UserModel] = []
  @Published var logout: Bool = false
  var selectedRecipe: RecieptModel?
  init() {
    loadData()
  }
  
  func loadData() {
      NetworkManager.shared.getNewUsers { newUsers in
          self.users = newUsers
      }
  }
    

    func approveUser(id: Int) {
        NetworkManager.shared.approveUser(id: id)
        users.removeAll(where: {$0.id == id})
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loadData()            
        }
    }
  
//  func deleteItem(id: Int) {
//    recieps.removeAll {$0.id == id}
//    NetworkManager.shared.deleteRecipe(id: id)
//  }
  
  
  func reloadUI() {
    reloadView.toggle()
  }
}
