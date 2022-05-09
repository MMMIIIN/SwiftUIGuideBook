import SwiftUI

struct FullScreenCoverSample: View {
    @State private var isFullScreenCover: Bool = false

    var body: some View {
        Button(action: { isFullScreenCover = true }, label: {
                EmptyView().playButton()
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
    }
}

struct FullScreenCoverSample_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverSample()
    }
}
