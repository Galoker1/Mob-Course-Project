//
//  RecieptsListViewModel.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 19.11.2023.
//

import Foundation

class RecieptsListViewModel: ObservableObject {
  @Published var recieps: [RecieptModel] = []
  @Published var reloadView: Bool = false
  @Published var isModalPresented = false
  @Published var isPersonPresented = false
  @Published var logout = false
  @Published var isAdmin = false
  var selectedRecipe: RecieptModel?
  init() {
    loadData()
  }
  
  func loadData() {
    recieps = []
    NetworkManager.shared.getMeInfo { data in
      if data?.role.roleID == 1 {
        self.isAdmin = true
      }
    }
    NetworkManager.shared.getRecieptModel { reciepts in
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

  }
  
  func reloadUI() {
    reloadView.toggle()
  }
  
  func forceDeleteReciep(id: Int) {
    NetworkManager.shared.deleteAdminRecipe(id: id)
    loadData()
  }
  func logoutAction() {
    isPersonPresented = false
    UserDefaults.standard.set(nil, forKey: "login")
    UserDefaults.standard.set(nil, forKey: "password")
    logout = true
  }
}
