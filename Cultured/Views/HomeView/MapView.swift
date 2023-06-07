//
//  MapView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/4/23.
//

import SwiftUI
import MapKit

struct MapBackgroundView: View {
    @ObservedObject var vm: DistrictsViewModel
    var body: some View {
        ZStack {
            MapView(region: $vm.mapRegion)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            Text("Map View")
//                .font(.title)
        }
    }
}

struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the map view if needed
        uiView.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var mapZoneRepView: MapView
        
        init(_ mapZoneRepView: MapView) {
            self.mapZoneRepView = mapZoneRepView
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
                mapView.region = mapView.region
            }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            mapZoneRepView.region = mapView.region
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapBackgroundView(vm: DistrictsViewModel())
    }
}


