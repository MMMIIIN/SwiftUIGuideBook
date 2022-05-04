import SwiftUI

struct PickerView: View {
    @State private var birthday = Date()
    @State private var alarm = Date()
    @State private var color: Color = .accentColor
    @State private var isPickerModal: Bool = false

    var body: some View {
        List {
            DatePicker(selection: $birthday,
                in: ...Date(),
                displayedComponents: .date,
                label: {
                    Text("Date")
                }
            )
            DatePicker("Time",
                selection: $alarm,
                displayedComponents: .hourAndMinute
            )
            ColorPicker("Color",
                selection: $color)
        }
        .navigationBarTitle("Picker View")
        .toolbar {
        ToolbarItem(placement: .primaryAction,
            content: {
                Button(action: { isPickerModal = true }) {
                    Image(systemName: "curlybraces.square")
                        .font(.system(size: 20))
                }
                    .sheet(isPresented: $isPickerModal) {
                    NavigationView {
                        MyWebView(urlToLoad: "https://github.com/MMMIIIN/SwiftUIGuideBook/blob/main/SwiftUIGuideBook/Views/TipView/PickerView.swift")
                            .toolbar() {
                            ToolbarItem(placement: .primaryAction) {
                                Button(action: {
                                    self.isPickerModal = false
                                }) {
                                    Text("Done").fontWeight(.semibold)
                                }
                            }
                        }
                    }

                }
            }
        )
    }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
