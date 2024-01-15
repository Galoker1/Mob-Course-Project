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
  var useCases = UseCases(repo: NetworkManager.shared)
  init() {
    loadData()
  }
  
  func loadData() {
      useCases.getNewUsers { newUsers in
          self.users = newUsers
      }
  }
    

    func approveUser(id: Int) {
        useCases.approveUser(id: id)
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
