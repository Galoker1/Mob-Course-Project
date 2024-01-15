//
//  RecieptsListView.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 19.11.2023.
//

import Foundation
import SwiftUI

struct RecieptListView: View {
  @ObservedObject var viewModel: RecieptsListViewModel
  @ObservedObject var loginModel: LoginViewModel
  @State private var isDetailPresented = false
  @State var selectedRecipe: RecieptModel?
  @State var newUsersPresented = false
  var body: some View {
    NavigationView {
      VStack {
        if viewModel.logout {
          VStack {
            Color.clear
              .frame(width: 1, height: 1)
          }
          .onAppear {
            loginModel.loggedIn = false
          }
        }
        ScrollView {
          HStack {
            Text("Reciepts")
              .font(.system(size: 30, weight: .bold))
              .padding(.leading, 10)
            Spacer()
            Button {
              viewModel.isPersonPresented.toggle()
            } label: {
              Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 10)
                .foregroundColor(Color.mint)
            }
            .sheet(isPresented: $viewModel.isPersonPresented) {
              PersonPageView(viewModel: .init(), listModel: viewModel)
            }
          }
          Button {
            newUsersPresented = true
          } label: {
            Spacer()
            Text("New Users")
              .foregroundColor(Color.white)
              .padding(10)
            Spacer()
          }
          .background(Color.mint)
          .cornerRadius(10)
          .padding(10)

          ForEach(viewModel.recieps, id: \.id) { reciep in
            Button {
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                viewModel.reloadUI()
                viewModel.selectedRecipe = reciep
                isDetailPresented.toggle()
              }
            } label: {
              HStack {
                Image(uiImage: reciep.picture ?? UIImage())
                  .resizable()
                  .frame(width: 100,height: 100)
                VStack {
                  HStack{
                    Text(reciep.name)
                      .multilineTextAlignment(.leading)
                      .font(.system(size: 30))
                      .foregroundColor(.white)
                      .lineLimit(1)
                    Spacer()
                  }
                  HStack {
                    Text(reciep.cookingMethod)
                      .multilineTextAlignment(.leading)
                      .foregroundColor(.white)
                      .lineLimit(1)
                    Spacer()
                  }
                }
                .padding(10)
                if viewModel.isAdmin {
                  Button {
                    viewModel.forceDeleteReciep(id: reciep.id)
                  } label: {
                    Image(systemName: "xmark.app.fill")
                      .foregroundColor(Color.white)
                  }
                }

              }
              .background(Color.mint)
              .cornerRadius(10)
              .padding(10)
            }
            .sheet(isPresented: $isDetailPresented) {
              DetailRecieptView(reciept: viewModel.selectedRecipe ?? viewModel.recieps[0])
            }
            .sheet(isPresented: $newUsersPresented) {
              NewUsersView(viewModel: NewUsersViewModel())
            }
          }
          
        }
        
      }
    }
    .navigationBarBackButtonHidden(true)
    .statusBar(hidden: true)
    .overlay(alignment: .bottomTrailing) {
      HStack{
        Button {
          viewModel.isModalPresented.toggle()
        } label: {
          Image(systemName: "plus")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(.white)
            .padding(10)          
        }
        .sheet(isPresented: $viewModel.isModalPresented) {
          CreateView(viewModel: viewModel)
        }
      }
      .background(.mint)
      .cornerRadius(30)
      .padding(.trailing, 20)
    }
    
  }
  
  
}


//struct RecieptListView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecieptListView()
//    }
//}

