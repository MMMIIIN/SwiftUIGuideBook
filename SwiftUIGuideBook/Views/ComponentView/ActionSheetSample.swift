import SwiftUI

struct ActionSheetSample: View {
    @State private var isActionSheet: Bool = false

    var body: some View {
        Button(action: { isActionSheet = true }, label: { EmptyView().playButton() })
            .confirmationDialog(Text("ActionSheet"), isPresented: $isActionSheet, actions: {
                Button("Delete", role: .destructive) { }
                Button("Option 1") { }
                Button("Option 2") { }
                Button("Cancle", role: .cancel) { }
            })
    }
}

struct ActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetSample()
    }
}
