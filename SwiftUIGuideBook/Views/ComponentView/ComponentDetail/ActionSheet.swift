import SwiftUI

struct ActionSheet: ComponentProtocol {
    @State private var isActionSheet: Bool = false
    
    let componentCategory: ComponentName = .ActionSheet

    let componentName = "Action Sheet"

    let swiftCode = """
@State private var isActionSheet: Bool = false
 Button(action: { isActionSheet = true },
  label: {
   Text("Action Sheet")})
    .confirmationDialog(Text("ActionSheet"),
     isPresented: $isActionSheet, actions: {
      Button("Delete", role: .destructive) { }
      Button("Option 1") { }
      Button("Option 2") { }
      Button("Cancle", role: .cancel) { }
})
"""

    let URL = "https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:message:)-8y541"
    
    var exampleView: AnyView {
        AnyView(Button(action: { isActionSheet = true }, label: {Text("")})
            .confirmationDialog(Text("ActionSheet"), isPresented: $isActionSheet, actions: {
                Button("Delete", role: .destructive) { }
                Button("Option 1") { }
                Button("Option 2") { }
                Button("Cancle", role: .cancel) { }
            })
        )
    }
}
