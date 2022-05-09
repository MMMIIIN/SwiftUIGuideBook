import SwiftUI

struct AlertSample: View {
    @State private var isAlert: Bool = false
    
    var body: some View {
        Button(action: { isAlert = true }, label: { EmptyView().playButton() })
            .alert("This is Alert", isPresented: $isAlert) { }
    }
}

struct AlertSample_Previews: PreviewProvider {
    static var previews: some View {
        AlertSample()
    }
}
