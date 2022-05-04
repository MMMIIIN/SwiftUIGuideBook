import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var searching: Bool

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText) { startedEditing in
                if startedEditing {
                    withAnimation {
                        searching = true
                    }
                }
            } onCommit: {
                withAnimation {
                    searching = false
                }
            }
        }
            .padding(.vertical, 10)
            .foregroundColor(.gray)
            .padding(.leading, 10)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
            .padding(.horizontal, 16)
    }
}

struct SearchView: View {
    let myFruits = [
        "Apple", "Watermelon", "Orange", "Pear", "Cherry", "Strawberry", "Nectarine", "Grape", "Mango", "Blueberry", "Pomegranate", "Plum", "Banana", "Raspberry", "Mandarin", "Jackfruit", "Papaya", "Kiwi", "Pineapple", "Lime", "Lemon", "Apricot", "Grapefruit", "Melon", "Coconut", "Avocado", "Peach"
    ]
    @State var searchText = ""
    @State var searching = false
    @State var isSearchModal: Bool = false

    var body: some View {
        VStack {
            SearchBar(searchText: $searchText, searching: $searching)
            List {
                ForEach(myFruits.filter({ (fruit: String) -> Bool in
                    return fruit.lowercased().hasPrefix(searchText.lowercased()) || searchText == ""
                }), id: \.self) { fruit in
                    Text(fruit)
                }
            }
                .listStyle(GroupedListStyle())
                .toolbar {
                if searching && searchText.count != 0 {
                    Button("Cancel") {
                        searchText = ""
                        withAnimation {
                            searching = false
                            UIApplication.shared.dismissKeyboard()
                        }
                    }
                }
            }
                .toolbar {
                ToolbarItem(placement: .primaryAction,
                    content: {
                        Button(action: { isSearchModal = true }) {
                            Image(systemName: "curlybraces.square")
                                .font(.system(size: 20))
                        }
                            .sheet(isPresented: $isSearchModal) {
                            NavigationView {
                                MyWebView(urlToLoad: "https://github.com/MMMIIIN/SwiftUIGuideBook/blob/main/SwiftUIGuideBook/Views/TipView/SearchView.swift")
                                    .toolbar() {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button(action: {
                                            self.isSearchModal = false
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
            .navigationBarTitle("Search Bar")
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
