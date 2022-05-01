import SwiftUI

struct Place: Identifiable, Hashable {
    let id: Int
    let name: String
    let country: String
    let city: String
    let street: String
    let zip: String
    let phoneNumber: String

    static func samples() -> [Place] { (0..<100).map(Place.fixture) }

    private static func fixture(_ id: Int) -> Place {
        Place(
            id: id,
            name: "Place #\(id)",
            country: "Country #\(id)",
            city: "City #\(id)",
            street: "Street #\(id)",
            zip: "Zip #\(id)",
            phoneNumber: "Phone #\(id)"
        )
    }
}

struct PlaceView: View {
    let place: Place
    let isExpanded: Bool
    @State private var isModalView: Bool = false

    var body: some View {
        HStack {
            content
            Spacer()
        }
            .contentShape(Rectangle())
    }

    private var content: some View {
        VStack(alignment: .leading) {
            Text(place.name).font(.headline)

            if isExpanded {
                VStack(alignment: .leading) {
                    Button("Button") {
                        self.isModalView = true
                    }
                        .sheet(isPresented: $isModalView) {
                        NavigationView {
                            Text("Swipe down to dismiss")
                        }
                    }
                }
            }
        }
    }
}

struct FilledButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title, action: action)
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8)
    }
}

//struct Component: View {
//    let componentName: String
//    let code: String
//    let URL: String
//    var body: some View {
//        HStack {
//            selectAction(modifierName: "Alert")
//        }
//    }

//    func selectAction(modifierName: String) -> some View {
//        var testBool: Bool = false
//        switch modifierName {
//        case "Alert" :
//            return Button("name") {
//                testBool = true
//            }
//                .alert("Testing", isPresented: testBool)
//            {
//                Button("삭제할래요", role: .destructive) {}
//                Button("아니요", role: .cancel) {}
//            }
//        default:
//            return Button("NULL") {}
//                .alert("Testing", isPresented: testBool)
//            {
//                Button("삭제할래요", role: .destructive) {}
//                Button("아니요", role: .cancel) {}
//            }
//        }
//    }
//}

struct ComponentView: View {
    let places: [Place]
    @State private var selection: Set<Place> = []

    var body: some View {
//        Component(componentName: "ComponentName", code: "testCode", URL: "testURL")

        ScrollView {
            ForEach(places) { place in
                PlaceView(place: place, isExpanded: self.selection.contains(place))
                    .onTapGesture { self.selectDeselect(place) }
                    .modifier(ListRowModifier())
                    .animation(.linear(duration: 0.3))
            }

        }
    }

    private func selectDeselect(_ place: Place) {
        if selection.contains(place) {
            selection.remove(place)
        } else {
            selection.insert(place)
        }
    }
}

struct NoelTestStruct: View {
    @Binding var testString: String
    var body: some View {
        Button("Change!!") {
            testString = "NoelBabo"
        }
    }
}

struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }.offset(x: 20)
    }
}

//struct ComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComponentView(places: ([Place(id: 0, name: "")]))
//    }
//}
