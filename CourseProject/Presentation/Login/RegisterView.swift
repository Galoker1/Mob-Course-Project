//
//  RegisterView.swift
//  CourseProject
//
//  Created by Егор  Хлямов on 19.11.2023.
//

import Foundation
import SwiftUI
import CoreData

struct RegisterView: View {
    @Binding var isPresented: Bool
    @State var textLogin = ""
    @State var textPassword = ""
    @State var textPasswordConfirm = ""
    @State var name = ""
    @State var surname = ""
    @State var status = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Register")
                    .font(.system(size: 40))
                TextField("Login", text: $textLogin)
                    .font(.system(size: 20))
                    .background(Color.mint)
                    .cornerRadius(3)
                    .padding(.horizontal, 20)
                
                TextField("Name", text: $name)
                    .font(.system(size: 20))
                    .background(Color.mint)
                    .cornerRadius(3)
                    .padding(.horizontal, 20)
                
                TextField("Surname", text: $surname)
                    .font(.system(size: 20))
                    .background(Color.mint)
                    .cornerRadius(3)
                    .padding(.horizontal, 20)
                
                TextField("Status", text: $status)
                    .font(.system(size: 20))
                    .background(Color.mint)
                    .cornerRadius(3)
                    .padding(.horizontal, 20)
                TextField("Password", text: $textPassword)
                    .font(.system(size: 20))
                    .background(Color.mint)
                    .cornerRadius(3)
                    .padding(.horizontal, 20)
                
                TextField("Password again", text: $textPasswordConfirm)
                    .font(.system(size: 20))
                    .background(Color.mint)
                    .cornerRadius(3)
                    .padding(.horizontal, 20)
                
                Button {
                    if textPassword == textPasswordConfirm {
                        NetworkManager.shared.register(
                            login: textLogin,
                            name: textPassword,
                            surname: name,
                            password: surname,
                            info: status)
                        isPresented = false
                    }
                        
                    
                } label: {
                    Spacer()
                    Text("Register")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 5)
                    Spacer()

                }
                    .cornerRadius(5)
                    .background(Color.mint)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
            Spacer()
            }
        }
        
    }
    
}



