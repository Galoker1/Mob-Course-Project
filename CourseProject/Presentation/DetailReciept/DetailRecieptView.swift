import SwiftUI

struct DetailRecieptView: View {
    var reciept: RecieptModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(uiImage: reciept.picture ?? UIImage())
                        .resizable()
                    HStack {
                        Text(reciept.name)
                            .font(.system(size: 20,weight: .bold))
                            .padding([.top,.horizontal],20)
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20,height: 20)
                            .foregroundColor(Color.mint)
                            .padding(.top,10)
                            .padding(.leading, 20)
                        Text(reciept.authorUsername)
                            .font(.system(size: 20))
                            .padding(.top,10)
                            .padding(.horizontal, 5)
                        Spacer()
                    }
                    HStack {
                        Text(reciept.cookingMethod)
                            .font(.system(size: 20))
                            .padding(.top,10)
                            .padding(.horizontal, 20)
                        Spacer()
                    }
                    HStack {
                        Text(reciept.product)
                            .font(.system(size: 20))
                            .padding(.top,10)
                            .padding(.horizontal, 20)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}
struct DetailRecieptView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecieptView(reciept: RecieptModel(id: 1, name: "Name", product: "product", cookingMethod: "method", link: "fdsf", authorID: 1, authorUsername: "goga"))
    }
}
