import SwiftUI

struct ActivityView: ComponentProtocol {
    let componentCategory: ComponentName = .ActivityView
    let componentName = "Activity View"

    let swiftCode = """
public struct ActivityView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    public let activityItmes: [Any]
    public let applicationActivities: [UIActivity]? = nil

    public func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        let activityViewController = UIActivityViewController(
            activityItems: activityItmes,
            applicationActivities: applicationActivities
        )

        if isPresented && uiViewController.presentedViewController == nil {
            uiViewController.present(activityViewController, animated: true)
        }
        activityViewController.completionWithItemsHandler = { (_, _, _, _) in
            isPresented = false
        }
    }
}

@State private var isActivityView: Bool = false
 Button(action: { isActivityView = true }, label: {
  Text("Activity Button")})
   .background(
    ActivityView( isPresented: $isActivityView,
     activityItmes: [URL(string: "https://github.com/MMMIIIN")!]))
"""

    let URL = "https://developer.apple.com/documentation/uikit/uiactivity/1620678-activityviewcontroller/"

    var exampleView: AnyView {
        AnyView(ActivityViewSample())
    }
}
