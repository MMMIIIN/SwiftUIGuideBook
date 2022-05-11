import SwiftUI

struct ContentView: View {
    @State var selection = 1

    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                ComponentView(components: Component.all())
                    .tabItem {
                    Image(systemName: "cube.fill")
                    Text("Component")
                }.tag(1)
                TipView()
                    .tabItem {
                    Image(systemName: "shippingbox.fill")
                    Text("Tip")
                }.tag(2)
                ComponentDetailView()
                    .tabItem {
                    Image(systemName: "cube.fill")
                    Text("Detail")

                }.tag(3)
            }
                .navigationBarTitle(selection == 1 ? "Component" : "Tip", displayMode: .inline)
        }
    }
}

extension View {
    func playButton() -> some View {
        HStack {
            Image(systemName: "play.fill")
                .foregroundColor(.white)
            Text("Play")
                .foregroundColor(.white)
        }
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(RoundedRectangle(cornerRadius: 20).fill(.blue))
            .frame(width: UIScreen.main.bounds.width * 0.28, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
