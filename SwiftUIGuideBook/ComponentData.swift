enum ComponentName: String {
    case Alert = "Alert"
    case ActionSheet = "Action Sheet"
    case ActivityView = "Activity View"
    case Sheet = "Sheet"
    case FullScreenCover = "Full Screen Cover"
}

struct Component: Identifiable, Hashable {
    let id: Int
    let name: String
    let code: String
    let URL: String

    static func all() -> [Component] {
        return [
            Component(id: 0, name: ComponentName.Alert.rawValue, code: "Code", URL: "URL"),
            Component(id: 1, name: ComponentName.ActionSheet.rawValue, code: "Code", URL: "URL"),
            Component(id: 2, name: ComponentName.ActivityView.rawValue, code: "Code", URL: "URL"),
            Component(id: 3, name: ComponentName.Sheet.rawValue, code: "Code", URL: "URL"),
            Component(id: 4, name: ComponentName.FullScreenCover.rawValue, code: "Code", URL: "URL")
        ]
    }
}
