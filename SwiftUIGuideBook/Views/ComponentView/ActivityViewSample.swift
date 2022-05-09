import SwiftUI

struct ActivityViewSample: View {
    @State private var isActivityView: Bool = false

    var body: some View {
        Button(action: { isActivityView = true }, label: { EmptyView().playButton() })
            .background(
            ActivityViewKit(
                isPresented: $isActivityView,
                activityItmes: ["https://github.com/MMMIIIN"]
            )
        )
    }
}

public struct ActivityViewKit: UIViewControllerRepresentable {
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

struct ActivityViewSample_Previews: PreviewProvider {
    static var previews: some View {
        ActivityViewSample()
    }
}
