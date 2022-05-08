enum ComponentName: String, CaseIterable {
    case Alert = "Alert"
    case ActionSheet = "Action Sheet"
    case ActivityView = "Activity View"
    case Sheet = "Sheet"
    case FullScreenCover = "Full Screen Cover"
    case Indicator = "Indicator"
    case ProgressBar = "Progress Bar"
    case ColorPicker = "Color Picker"
}

struct Component: Identifiable, Hashable {
    let id: Int
    let name: String
    let URL: String
    var codeText: String

    static func all() -> [Component] {
        return [
            Component(id: 0, name: ComponentName.Alert.rawValue, URL: "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l",
                codeText:
                    """
 @State private var isAlert: Bool = false
  Button(action: { isAlert = true }, label: {
   Text("Alert")})
    .alert("This is Alert", isPresented: $isAlert) { }
"""
            ),
            Component(id: 1, name: ComponentName.ActionSheet.rawValue, URL: "https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:message:)-8y541",
                codeText:
                    """
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
            ),
            Component(id: 2, name: ComponentName.ActivityView.rawValue, URL: "https://developer.apple.com/documentation/uikit/uiactivity/1620678-activityviewcontroller/",
                codeText:
                    """
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
            ),
            Component(id: 3, name: ComponentName.Sheet.rawValue, URL: "https://developer.apple.com/documentation/SwiftUI/View/sheet(isPresented:onDismiss:content:)",
                codeText:
                    """
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
            ),
            Component(id: 4, name: ComponentName.FullScreenCover.rawValue, URL: "https://developer.apple.com/documentation/swiftui/path/fullscreencover(item:ondismiss:content:)/",
                codeText:
                    """
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
            ),
            Component(id: 5, name: ComponentName.Indicator.rawValue, URL: "https://developer.apple.com/documentation/swiftui/progressview",
                codeText:
                    """
ProgressView(label: {
 Text("Loading").font(.caption).foregroundColor(.secondary)})
  .progressViewStyle(CircularProgressViewStyle())
  .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
"""),
            Component(id: 6, name: ComponentName.ProgressBar.rawValue, URL: "https://developer.apple.com/documentation/swiftui/linearprogressviewstyle",
                codeText:
                    """
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
            )
        ]
    }
}
