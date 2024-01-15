//
//  LoginView.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 19.11.2023.
//


import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
  @State var registerPresented: Bool = false
    @State private var showingAlert = false
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          Text("Reciepts")
            .font(.system(size: 40))
          TextField("Login", text: $viewModel.textLogin)
            .font(.system(size: 20))
            .background(Color.mint)
            .cornerRadius(3)
            .padding(.horizontal, 20)
          
          SecureField("Password", text: $viewModel.textPassword)
            .font(.system(size: 20))
            .background(Color.mint)
            .cornerRadius(3)
            .padding(.horizontal, 20)
            
          ZStack {
            NavigationLink(destination: RecieptListView(viewModel: RecieptsListViewModel(), loginModel: viewModel), isActive: $viewModel.loggedIn) {
              Button {
                viewModel.login(textLogin: viewModel.textLogin, textPassword: viewModel.textPassword) { result in
                    $viewModel.loggedIn.wrappedValue = result
                }
              } label: {
                Spacer()
                Text("Login")
                  .foregroundColor(Color.white)
                  .padding(.vertical, 5)
                Spacer()
              }
              .cornerRadius(5)
              .background(Color.mint)
              .padding(.top, 20)
              .padding(.horizontal, 20)
            }
          }
    
          NavigationLink(destination: RegisterView(isPresented: $registerPresented), isActive: $registerPresented) {
            Button {
              registerPresented = true
            } label: {
              Text("Create new account")
                .foregroundColor(Color.mint)              
            }
          }
        }
        
        if viewModel.showingAlert {
          Color.clear
            .alert("Wrong Login or Password. Try again or register", isPresented: $viewModel.showingAlert) {
              Button("OK", role: .cancel) { }
            }
        }
        
      }
    }
    
  }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}

