import SwiftUI

struct CategoryView: View {
    @State var currentDevice: String = "Mac"
    var testList = ["Mac", "iPhone", "iPad", "Apple Watch", "Apple TV", "Accessory"]
    @State var isCategoryModal: Bool = false

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
            }.padding()
                .toolbar {
                ToolbarItem(placement: .primaryAction,
                    content: {
                    Button(action: { isCategoryModal = true }) {
                            Image(systemName: "curlybraces.square")
                                .font(.system(size: 20))
                        }
                            .sheet(isPresented: $isCategoryModal) {
                            NavigationView {
                                MyWebView(urlToLoad: "https://github.com/MMMIIIN/SwiftUIGuideBook/blob/main/SwiftUIGuideBook/Views/TipView/CategoryView.swift")
                                    .toolbar() {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button(action: {
                                            self.isCategoryModal = false
                                        }) {
                                            Text("Done").fontWeight(.semibold)
                                        }
                                    }
                                }
                            }
                        }
                    }
                )
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
