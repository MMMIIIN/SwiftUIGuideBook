import SwiftUI
import MapKit

struct MapView: View {
    @State private var coordinateRegion =
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3348, longitude: -122.0090),
                       span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var isModalSheet: Bool = false

    var body: some View {
        Map(coordinateRegion: $coordinateRegion)
            .aspectRatio(1.0, contentMode: .fill)
            .navigationBarTitle("Map View")
            .toolbar {
            ToolbarItem(placement: .primaryAction,
                content: {
                    Button(action: { isModalSheet = true }) {
                        Image(systemName: "curlybraces.square")
                            .font(.system(size: 20))
                    }
                        .sheet(isPresented: $isModalSheet) {
                        NavigationView {
                            MyWebView(urlToLoad: "https://github.com/MMMIIIN/SwiftUIGuideBook/blob/main/SwiftUIGuideBook/Views/TipView/MapView.swift")
                                .toolbar() {
                                ToolbarItem(placement: .primaryAction) {
                                    Button(action: {
                                        self.isModalSheet = false
                                    }) {
                                        Text("Done").fontWeight(.semibold)
                                    }
                                }
                            }
                        }
                    }
                }
            )
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
