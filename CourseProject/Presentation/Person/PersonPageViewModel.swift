//
//  PersonPageViewModel.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 16.12.2023.
//

import Foundation

class PersonPageViewModel: ObservableObject {
  @Published var user: UserModel? = nil
  @Published var reloadView: Bool = false
  @Published var recieps: [RecieptModel] = []
  @Published var logout: Bool = false
  var selectedRecipe: RecieptModel?
  init() {
    loadData()
  }
  
  func loadData() {
    NetworkManager.shared.getMyRecieptModel { reciepts in
      DispatchQueue.main.async {
        self.recieps = reciepts
        for reciep in self.recieps {
          NetworkManager.shared.loadImage(from: reciep.link) { image in
            reciep.picture = image
            self.reloadUI()
          }
        }
      }
    }
    NetworkManager.shared.getMeInfo { user in
      DispatchQueue.main.async {
        if let user = user {
          self.user = user
        }
      }
    }
    reloadUI()
  }
  
  func deleteItem(id: Int) {
    recieps.removeAll {$0.id == id}
    NetworkManager.shared.deleteRecipe(id: id)
  }
  
  
  func reloadUI() {
    reloadView.toggle()
  }
}
