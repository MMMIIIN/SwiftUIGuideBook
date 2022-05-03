import SwiftUI
import MapKit

struct MapView: View {
    @State private var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3348, longitude: -122.0090), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        Map(coordinateRegion: $coordinateRegion)
            .aspectRatio(1.0, contentMode: .fill)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
