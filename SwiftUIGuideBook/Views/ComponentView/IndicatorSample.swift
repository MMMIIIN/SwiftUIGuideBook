import SwiftUI

struct IndicatorSample: View {
    var body: some View {
        ProgressView(label: {
            Text("Loading").font(.caption).foregroundColor(.secondary)
        }).progressViewStyle(CircularProgressViewStyle())
            .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
    }
}

struct IndicatorSample_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorSample()
    }
}
