import SwiftUI

struct Alert: ComponentProtocol {
    @State private var isAlert: Bool = false
    
    let componentCategory: ComponentName = .Alert

    let componentName = "Alert"

    let swiftCode = """
 @State private var isAlert: Bool = false
  Button(action: { isAlert = true }, label: {
   Text("Alert")})
    .alert("This is Alert", isPresented: $isAlert) { }
"""

    let URL = "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l"

    var exampleView: AnyView {
        AnyView(
            Button(action: { isAlert = true }, label: { Text("") })
                .alert("This is Alert", isPresented: $isAlert) { }
        )
    }
}
