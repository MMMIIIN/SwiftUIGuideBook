import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ComponentView(places: Place.samples())
                .tabItem {
                    Image(systemName: "cube.fill")
                    Text("Component")
                }
            TipView(componentList: Component.all())
                .tabItem {
                    Image(systemName: "shippingbox.fill")
                    Text("Tip")
                }
        }
        .navigationBarTitle("View Component", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
