import SwiftUI

struct CreateView: View {
    @State var name = ""
    @State var cookingMethod = ""
    @State var products = ""
    @State var linkToPicture = ""
    @ObservedObject var viewModel: RecieptsListViewModel
    var body: some View {
        NavigationView {
          VStack {
            VStack {
              HStack {
                Text("New Receipt")
                  .font(.system(size: 30, weight: .bold))
                  .padding(.horizontal, 20)
                Spacer()
              }
              HStack {
                Text("Name")
                  .font(.system(size: 20))
                  .padding([.top,.horizontal],20)
                Spacer()
              }
              TextEditor(text: $name)
                .frame(height: 30)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .font(.system(size: 20))
                .overlay(
                  RoundedRectangle(cornerRadius:5)
                    .stroke(Color.mint, lineWidth: 2)
                    .frame(height: 30)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                )
              
              
              HStack {
                Text("CookingMethod")
                  .font(.system(size: 20))
                  .padding([.top,.horizontal],20)
                Spacer()
              }
              TextEditor(text: $cookingMethod)
                .frame(height: 100)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .font(.system(size: 20))
                .overlay(
                  RoundedRectangle(cornerRadius:5)
                    .stroke(Color.mint, lineWidth: 2)
                    .frame(height: 100)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                )
              HStack {
                Text("Products")
                  .font(.system(size: 20))
                  .padding([.top,.horizontal],20)
                Spacer()
              }
              TextEditor(text: $products)
                .frame(height: 100)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .font(.system(size: 20))
                .overlay(
                  RoundedRectangle(cornerRadius:5)
                    .stroke(Color.mint, lineWidth: 2)
                    .frame(height: 100)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                )
              HStack {
                Text("Picture")
                  .font(.system(size: 20))
                  .padding([.top,.horizontal],20)
                Spacer()
              }
              TextEditor(text: $linkToPicture)
                .frame(height: 30)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .font(.system(size: 20))
                .overlay(
                  RoundedRectangle(cornerRadius:5)
                    .stroke(Color.mint, lineWidth: 2)
                    .frame(height: 30)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                )
              Button {
                NetworkManager.shared.addRecipe(name: name, method: cookingMethod, products: products, image: linkToPicture)
                viewModel.isModalPresented = false
                viewModel.loadData()
              } label: {
                HStack {
                  
                  Spacer()
                  Text("Create")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 5)
                  Spacer()
                  
                }
                .cornerRadius(5)
                .background(Color.mint)
              }
              .padding(.top, 20)
              .padding(.horizontal, 20)
              .cornerRadius(10)
            }
            Spacer()
          }
          .padding(.top, 10)
        }
    }
}

