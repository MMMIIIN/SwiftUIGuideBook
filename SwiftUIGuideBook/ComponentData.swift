enum ComponentName: String {
    case Alert = "Alert"
    case ActionSheet = "Action Sheet"
    case ActivityView = "Activity View"
    case Sheet = "Sheet"
    case FullScreenCover = "Full Screen Cover"
    case Indicator = "Indicator"
    case ProgressBar = "Progress Bar"
}

struct Component: Identifiable, Hashable {
    let id: Int
    let name: String
    let codeImage: [String]
    let URL: String

    static func all() -> [Component] {
        return [
            Component(id: 0, name: ComponentName.Alert.rawValue, codeImage: ["alert_var", "alert_screenshot"], URL: "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l"),
            Component(id: 1, name: ComponentName.ActionSheet.rawValue, codeImage: ["actionsheet_var", "actionsheet_screenshot"], URL: "https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:message:)-8y541"),
            Component(id: 2, name: ComponentName.ActivityView.rawValue, codeImage: ["activity_var", "activity_screenshot1", "activity_screenshot2"], URL: "https://developer.apple.com/documentation/uikit/uiactivity/1620678-activityviewcontroller/"),
            Component(id: 3, name: ComponentName.Sheet.rawValue, codeImage: ["sheet_var", "sheet_screenshot"], URL: "https://developer.apple.com/documentation/SwiftUI/View/sheet(isPresented:onDismiss:content:)"),
            Component(id: 4, name: ComponentName.FullScreenCover.rawValue, codeImage: ["fullscreen_var", "fullscreen_screenshot"], URL: "https://developer.apple.com/documentation/swiftui/path/fullscreencover(item:ondismiss:content:)/"),
            Component(id: 5, name: ComponentName.Indicator.rawValue, codeImage: ["indicator_screenshot"], URL: "https://developer.apple.com/documentation/swiftui/progressview"),
            Component(id: 6, name: ComponentName.ProgressBar.rawValue, codeImage: ["progressbar_var", "progressbar_screenshot"], URL: "https://developer.apple.com/documentation/swiftui/linearprogressviewstyle")
        ]
    }
}
