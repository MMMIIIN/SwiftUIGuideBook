import SwiftUI

struct ProgressBar: ComponentProtocol {
    let componentCategory: ComponentName = .progressBar

    let componentName = "ProgressBar"

    let swiftCode = """
@State private var progress: Double = 0.0
 ProgressView(value: progress, total: 100,
  label: {
   Text("Downloading...")
    .padding(.bottom, 4)},
    currentValueLabel: {
     Text("progress")
      .padding(.top, 4)})
     .progressViewStyle(LinearProgressViewStyle())
      .onReceive(timer) { _ in
    if progress < 100 {
     progress += 1
    } else {
    progress = 0
 }
}
"""

    let URL = "https://developer.apple.com/documentation/swiftui/linearprogressviewstyle"

    var exampleView: AnyView {
        AnyView(ProgressBarSample())
    }
}
