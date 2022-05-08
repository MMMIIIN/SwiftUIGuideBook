import SwiftUI

struct Sheet: ComponentProtocol {
    @State private var isSheet: Bool = false

    let componentCategory: ComponentName = .Sheet

    let componentName = "Sheet"

    let swiftCode = """
@State private var isSheet: Bool = false
 Button(action: { isSheet = true }, label: {
  Text("Sheet")})
   .sheet(isPresented: $isSheet) {
    NavigationView {
     Text("Swipe down to dismiss")
      .toolbar() {
       ToolbarItem(placement: .primaryAction) {
        Button(action: { self.isSheet = false}) {
         Text("Done").fontWeight(.semibold)
    }
   }
  }
 }
}
"""

    let URL = "https://developer.apple.com/documentation/SwiftUI/View/sheet(isPresented:onDismiss:content:)"

    var exampleView: AnyView {
        AnyView(Button(action: { isSheet = true }, label: {
                Text("Sheet")
            })
                .sheet(isPresented: $isSheet) {
                NavigationView {
                    Text("Swipe down to dismiss")
                        .toolbar() {
                        ToolbarItem(placement: .primaryAction) {
                            Button(action: {
                                self.isSheet = false
                            }) {
                                Text("Done").fontWeight(.semibold)
                            }
                        }
                    }
                }
            }
        )
    }
}
