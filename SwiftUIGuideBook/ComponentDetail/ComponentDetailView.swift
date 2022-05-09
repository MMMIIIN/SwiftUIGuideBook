import SwiftUI

struct ComponentDetailView: View {
    private var componentDetails: [ComponentProtocol] = componentDetailCollections
    @State private var isCodeBlock: Bool = false
    @State private var swiftCode: String = ""

    var body: some View {
        ScrollView {
            ForEach(componentDetails, id: \.componentCategory) { component in
                Text(component.componentName)
                HStack {
                    component.exampleView
                    codeImage(component.swiftCode).sheet(isPresented: $isCodeBlock) {
                        SwiftCodeEditor(component.swiftCode)
                    }
                    higURL(component.URL)
                }
            }
        }
    }

    private func codeImage(_ value: String) -> some View {
        Button(action: {
            swiftCode = value
            isCodeBlock = true
        }, label: {
                Image(systemName: "curlybraces.square.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
                    .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
            })
    }

    private func higURL(_ value: String) -> some View {
        Link(destination: URL(string: value)!, label: {
                Image(systemName: "doc.fill")
                    .font(.system(size: 25))
                    .foregroundColor(.blue)
                    .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
            })
    }
}

struct ComponentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentDetailView()
    }
}
