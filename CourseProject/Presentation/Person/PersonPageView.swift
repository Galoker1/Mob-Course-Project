//
//  PersonPageView.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 16.12.2023.
//

import Foundation
import SwiftUI

struct PersonPageView: View {
  @ObservedObject var viewModel: PersonPageViewModel
  @ObservedObject var listModel: RecieptsListViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        HStack {
          Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 60, height: 60)
            .padding(.trailing, 10)
            .foregroundColor(Color.mint)
        }
        .padding(.top, 30)
        HStack {
          Text("\(viewModel.user?.name ?? "") \(viewModel.user?.surname ?? "")")
            .font(.system(size: 30, weight: .bold))
            .padding(.leading, 10)
          
          Button {
            listModel.logoutAction()
          } label: {
            Image(systemName: "square.and.arrow.up")
              .resizable()
              .frame(width: 20, height: 20)
              .rotationEffect(.degrees(90))
              .foregroundColor(.white)
              .padding(5)
              .background(Color.mint)
              .cornerRadius(5)
          }
        }
        .padding(.top, 30)
        List {
          
          ForEach(viewModel.recieps, id: \.id) { reciep in
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
              }
            }
            .background(Color.mint)
            .cornerRadius(10)
            .padding(0)
            .swipeActions {
              Button("Delete") {
                viewModel.deleteItem(id: reciep.id)
              }
              .tint(.red)
            }
            //          .sheet(isPresented: $isDetailPresented) {
            //            DetailRecieptView(reciept: viewModel.selectedRecipe ?? viewModel.recieps[0])
            //          }
          }
        }
        .listRowSeparator(.hidden)
        .padding(0)
        Spacer()
      }
    }
  }
}
