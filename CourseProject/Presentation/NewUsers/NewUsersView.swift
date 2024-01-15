//
//  NewUsersView.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 14.01.2024.
//

import Foundation
import SwiftUI

struct NewUsersView: View {
  @ObservedObject var viewModel: NewUsersViewModel

  var body: some View {
      VStack {
          List {
              ForEach(viewModel.users, id: \.id) { user in
                  Text(user.username)
                      .swipeActions {
                        Button("Approve") {
                            viewModel.approveUser(id: user.id)
                        }
                        .tint(.green)
                      }
                  
              }
          }
      }
      .onAppear {
          viewModel.loadData()
      }
      
  }
  
  
}
