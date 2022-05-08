import SwiftUI

struct FullScreenCover: ComponentProtocol {
    @State private var isFullScreenCover: Bool = false

    let componentCategory: ComponentName = .FullScreenCover

    let componentName = "FullScreenCover"

    let swiftCode = """
@State private var isFullScreenCover: Bool = false
 Button(action: { isFullScreenCover = true }, label: {
  Text("FullScreenCover")})
   .fullScreenCover(isPresented: $isFullScreenCover) {
    NavigationView {
     Text("Tap to done")
      .toolbar {
       ToolbarItem(placement: .primaryAction) {
        Button(action: { self.isFullScreenCover = false}) {
     Text("Done").fontWeight(.semibold)
    }
   }
  }
 }
}
"""

    let URL = "https://developer.apple.com/documentation/swiftui/path/fullscreencover(item:ondismiss:content:)/"

    var exampleView: AnyView {
        AnyView(Button(action: { isFullScreenCover = true }, label: {
                Text("FullScreenCover")
            })
                .fullScreenCover(isPresented: $isFullScreenCover) {
                NavigationView {
                    Text("Tap to done")
                        .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button(action: {
                                self.isFullScreenCover = false
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
