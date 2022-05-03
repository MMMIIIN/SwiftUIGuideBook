import SwiftUI

struct CategoryView: View {
    @State private var currentDevice: String = "Mac"
    private var testList = ["Mac", "iPhone", "iPad", "Apple Watch", "Apple TV", "Accessory"]

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Category Button")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(testList, id: \.self) { value in
                            currentDevice == value
                                ? Button(action: { }, label: { Text(value)
                                        .padding(.all, 10)
                                        .foregroundColor(.white)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 1))
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                                })
                            : Button(action: {
                                currentDevice = value
                            }, label: {
                                    Text(value)
                                        .padding(.all, 10)
                                        .foregroundColor(.black)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 1))
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                })
                        }
                            .padding(.all, 5)
                    }
                }
                ScrollView(.horizontal) {
                    Image("category_screenshot")
                        .resizable()
                    .aspectRatio(contentMode: .fill)
                }
            }.padding()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
