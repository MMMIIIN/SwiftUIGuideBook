import SwiftUI

struct Indicator: ComponentProtocol {
    let componentCategory: ComponentName = .indicator

    let componentName = "Indicator"

    let swiftCode = """
ProgressView(label: {
 Text("Loading").font(.caption).foregroundColor(.secondary)})
  .progressViewStyle(CircularProgressViewStyle())
  .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
"""

    let URL = "https://developer.apple.com/documentation/swiftui/progressview"

    var exampleView: AnyView {
        AnyView(IndicatorSample())
    }
}
