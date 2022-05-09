import SwiftUI

struct ProgressBarSample: View {
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @State private var progress: Double = 0.0

    var body: some View {
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
            .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
    }
}

struct ProgressBarSample_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarSample()
    }
}
