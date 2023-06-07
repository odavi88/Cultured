////
////  MapZones.swift
////  Cultured
////
////  Created by Omar Davidson II on 6/4/23.
////
//
//import SwiftUI
//import MapKit
//
//struct MapZoneView: View {
//    @ObservedObject var viewModel: MapZoneViewModel
//
//    var body: some View {
//        ZStack {
//            MapZoneRepView(region: $viewModel.mapRegion)
//                .ignoresSafeArea()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//            GeometryReader { proxy in
//                // MARK: Blur Effect Here
//                BlurView(style: .systemUltraThinMaterial)
//                ScrollView {
//                    VStack {
//                        // MARK: Task List Here
//                        ForEach(viewModel.zones) { zone in
//                            Button(action: {
//                                viewModel.selectZone(zone)
//                            }) {
//                                Text(zone.name)
//                                    .padding()
//                            }
//                        }
//                    }
//                }
//                .padding(.top, 50) // Adjust the padding as needed
//            }
//            .offset(y: viewModel.drawerOffset)
//                        .gesture(
//                            DragGesture()
//                                .onChanged { value in
//                                    viewModel.onDragChanged(value)
//                                }
//                                .onEnded { value in
//                                    viewModel.onDragEnded(value)
//                                }
//                        )
//                        .animation(.spring())
//        }
//    }
//}
//
//struct MapZoneView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapZoneView(viewModel: MapZoneViewModel())
//    }
//}
//
//struct MapZoneRepView: UIViewRepresentable {
//    @Binding var region: MKCoordinateRegion
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView(frame: .zero)
//        mapView.delegate = context.coordinator
//        return mapView
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        uiView.setRegion(region, animated: true)
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MapZoneRepView
//
//        init(_ parent: MapZoneRepView) {
//            self.parent = parent
//        }
//
//        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//            parent.region = mapView.region
//        }
//    }
//}
//
//class MapZoneViewModel: ObservableObject {
//    @Published var zones: [Zone] = [
//        // MARK: Mission Dolores Basilica Zone
//        Zone(name: "Zone 1", coordinate: CLLocationCoordinate2D(latitude: 37.759773, longitude: -122.427063)),
//        // MARK: Fisherman's Wharf Zone
//        Zone(name: "Zone 2", coordinate: CLLocationCoordinate2D(latitude: 37.808218, longitude: -122.415794)),
//        // MARK: Coit Tower Zone
//        Zone(name: "Zone 3", coordinate: CLLocationCoordinate2D(latitude: 37.802678, longitude: -122.405977)),
//        Zone(name: "Zone 4", coordinate: CLLocationCoordinate2D(latitude: 37.778406, longitude: -122.389243)),
//    ]
//
//    @Published var mapRegion: MKCoordinateRegion
//    @Published var drawerOffset: CGFloat = 0
//
//    init() {
//        let initialCoordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
//        let span = MKCoordinateSpan(latitudeDelta: 0.011, longitudeDelta: 0.011)
//        mapRegion = MKCoordinateRegion(center: initialCoordinate, span: span)
//    }
//
//    func onDragChanged(_ value: DragGesture.Value) {
//            let translation = value.translation.height
//            let safeAreaHeight = UIScreen.main.bounds.height * 2 / 3 // Updated safe area height
//            let offset = drawerOffset + translation
//            drawerOffset = min(max(offset, 0), safeAreaHeight) // Adjusted offset range
//        }
//    func onDragEnded(_ value: DragGesture.Value) {
//        let translation = value.translation.height
//    }
//
//    func selectZone(_ zone: Zone) {
//        mapRegion = MKCoordinateRegion(center: zone.coordinate, span: mapRegion.span)
//    }
//}
//
////struct Zone: Identifiable {
////    let id = UUID()
////    let name: String
////    let coordinate: CLLocationCoordinate2D
////}
//
