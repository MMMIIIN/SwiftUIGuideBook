import SwiftUI

struct PickerView: View {
    @State private var birthday = Date()
    @State private var alarm = Date()
    @State private var color: Color = .accentColor

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
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
