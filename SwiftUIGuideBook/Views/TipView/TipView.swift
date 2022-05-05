import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    var urlToLoad: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }

        let webView = WKWebView()

        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {}
}

struct TipView: View {
    @State var testPageBool = false

    var body: some View {
        VStack {
            List {
                NavigationLink(destination: CategoryView(), label: {
                        Text("Category View")
                    })
                NavigationLink(destination: SearchView(), label: {
                        Text("Search View")
                    })
                NavigationLink(destination: MapView(), label: {
                        Text("Map View")
                    })
                NavigationLink(destination: PickerView(), label: {
                        Text("Picker View")
                    })
            }
                .onAppear() {
                print("testPageBool : \(testPageBool)")
            }
        }
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView()
    }
}
