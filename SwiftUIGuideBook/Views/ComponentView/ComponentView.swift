import SwiftUI
import CodeEditorView

struct TestComponentView: View {
    let compoenet: Component
    let isExpanded: Bool
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var isCodeBlock: Bool = false
    @State private var isAlert: Bool = false
    @State private var isActionSheet: Bool = false
    @State private var isActivityView: Bool = false
    @State private var isSheet: Bool = false
    @State private var isFullScreenCover: Bool = false
    @State private var progress: Double = 0.0
    @State var text: String
    @State private var position: CodeEditor.Position = CodeEditor.Position()
    @State private var messages: Set<Located<Message>> = Set()
    @Environment(\.colorScheme) private var colorScheme: ColorScheme


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
                            .confirmationDialog(Text("ActionSheet"), isPresented: $isActionSheet, actions: {
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
                            ActivityViewKit(
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

                    case ComponentName.Indicator.rawValue:
                        ProgressView(label: {
                            Text("Loading").font(.caption).foregroundColor(.secondary)
                        }).progressViewStyle(CircularProgressViewStyle())
                            .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)

                    case ComponentName.ProgressBar.rawValue:
                        ProgressView(value: progress, total: 100,
                            label: {
                                Text("Downloading...")
                                    .padding(.bottom, 4)
                            }, currentValueLabel: {
                                Text("\(Int(progress))%")
                                    .padding(.top, 4)
                            }
                        ).progressViewStyle(LinearProgressViewStyle())
                            .onReceive(timer) { _ in
                            if progress < 100 {
                                progress += 1
                            } else {
                                progress = 0
                            }
                        }

                    default:
                        Text("Default")
                    }

                    Button(action: { isCodeBlock = true }, label: {
                            Image(systemName: "curlybraces.square.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
                        })
                        .sheet(isPresented: $isCodeBlock, content: {
                        GroupBox {
                            CodeEditor(text: $text, position: $position, messages: $messages, language: .swift)
                                .environment(\.codeEditorTheme,
                                colorScheme == .dark ? Theme.defaultDark : Theme.defaultLight)
                        }.toolbar() {
                            ToolbarItem(placement: .primaryAction) {
                                Button(action: {
                                    self.isCodeBlock = false
                                }) {
                                    Text("Done").fontWeight(.semibold)
                                }
                            }
                        }
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
    @State private var selection: Set<Component> = []

    var body: some View {
        ScrollView {
            ForEach(components) { value in
                TestComponentView(compoenet: value, isExpanded: self.selection.contains(value), text: value.codeText)
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
