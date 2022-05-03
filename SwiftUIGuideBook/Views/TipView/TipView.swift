import SwiftUI

struct TipView: View {

    var body: some View {
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
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView()
    }
}
