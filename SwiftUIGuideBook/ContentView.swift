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
                    TipView(componentList: Component.all())
                        .tabItem {
                        Image(systemName: "shippingbox.fill")
                        Text("Tip")
                    }.tag(2)
            }
            .navigationBarTitle(selection == 1 ? "Component" : "Tip", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
