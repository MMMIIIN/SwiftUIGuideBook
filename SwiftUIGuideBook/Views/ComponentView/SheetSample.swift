import SwiftUI

struct SheetSample: View {
    @State private var isSheet: Bool = false

    var body: some View {
        Button(action: { isSheet = true }, label: {
                EmptyView().playButton()
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
    }
}

struct SheetSample_Previews: PreviewProvider {
    static var previews: some View {
        SheetSample()
    }
}
