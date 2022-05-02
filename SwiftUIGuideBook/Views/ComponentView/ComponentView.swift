import SwiftUI

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

struct TestComponentView: View {
    let compoenet: Component
    let isExpanded: Bool

    @State private var isAlert: Bool = false
    @State private var isActionSheet: Bool = false
    @State private var isActivityView: Bool = false
    @State private var isSheet: Bool = false
    @State private var isFullScreenCover: Bool = false

    var body: some View {
        HStack {
            content
            Spacer()
        }
            .padding(.vertical, 10)
            .contentShape(Rectangle())
    }

    private var playButton: some View {
        HStack {
            Image(systemName: "play.fill")
                .foregroundColor(.white)
            Text("Play")
                .foregroundColor(.white)
        }
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(RoundedRectangle(cornerRadius: 20).fill(.blue))
            .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
    }

    private var content: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(compoenet.name).font(.headline)
                Spacer()
                isExpanded ? Image(systemName: "chevron.up") : Image(systemName: "chevron.down")
            }
            if isExpanded {
                HStack {
                    switch compoenet.name {
                    case ComponentName.Alert.rawValue:
                        Button(action: { isAlert = true }, label: {
                                playButton
                            })
                            .alert("This is Alert", isPresented: $isAlert) { }
                    case ComponentName.ActionSheet.rawValue:
                        Button(action: { isActionSheet = true }, label: {
                                playButton
                            })
                            .confirmationDialog(Text(compoenet.name), isPresented: $isActionSheet, actions: {
                                Button("Delete", role: .destructive) { }
                                Button("Option 1") { }
                                Button("Option 2") { }
                                Button("Cancle", role: .cancel) { }
                            })
                    case ComponentName.ActivityView.rawValue:
                        Button(action: { isActivityView = true }, label: {
                                playButton
                            })
                            .background(
                            ActivityView(
                                isPresented: $isActivityView,
                                activityItmes: [URL(string: "https://github.com/MMMIIIN")!]
                            )
                        )
                    case ComponentName.Sheet.rawValue:
                        Button(action: { isSheet = true }, label: {
                                playButton
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
                    case ComponentName.FullScreenCover.rawValue:
                        Button(action: { isFullScreenCover = true }, label: {
                                playButton
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
                    default:
                        Text("Default")
                    }
                    Button(action: { }, label: {
                            Image(systemName: "curlybraces.square.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
                        })
                    
                    Link(destination: URL(string: compoenet.URL)!, label: {
                        Image(systemName: "doc.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.blue)
                            .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
                                })
                }
                    .padding(.vertical, 10)
            }
        }
    }
}

struct ComponentView: View {
    let components: [Component]
    @State private var selection: Set<Component> = [Component(id: 0, name: ComponentName.Alert.rawValue, code: "Code", URL: "URL")]

    var body: some View {
        ScrollView {
            ForEach(components, id: \.name) { value in
                TestComponentView(compoenet: value, isExpanded: self.selection.contains(value))
                    .onTapGesture { self.selectDeselect(value) }
                    .modifier(ListRowModifier())
                    .animation(Animation.linear(duration: 0.3))
            }
        }
    }

    private func selectDeselect(_ value: Component) {
        if selection.contains(value) {
            selection.remove(value)
        } else {
            selection.insert(value)
        }
    }
}

struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }
            .padding(.horizontal, 16)
    }
}

struct ComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentView(components: Component.all())
    }
}
