//
//  ContentView.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/27/23.
//

import SwiftUI
import MapKit

#warning("How are each of these districts connected?")
#warning("Is it possible for each of them to be reached with out access to car/ride-share?")

struct DistrictsView: View {
    @EnvironmentObject private var vm: DistrictsViewModel
//    @ObservedObject var viewModel: LocationViewModel
    
    var body: some View {
        ZStack {
            MapView() // Add the map view as the background
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                // MARK: Location Area Picker
                header
                    .padding()
                Spacer()
            }
            // MARK: Bottom Drawer
            BottomDrawerView()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        DistrictsView()
            .environmentObject(DistrictsViewModel())
//        DistrictsView(viewModel: LocationViewModel(locations: [Location(name: "", services: [""], coordinates: CLLocationCoordinate2D(latitude: 42.3319, longitude:  -83.0466), imageNames: [""], link: "")]))
//            .environmentObject(DistrictsViewModel())
//
//        DistrictsView(viewModel: LocationViewModel(locations: [Location(name: "", services: [""], coordinates: CLLocationCoordinate2D(latitude: 42.3319, longitude:  -83.0466), imageNames: [""], link: "")]))
//            .environmentObject(DistrictsViewModel())
//            .preferredColorScheme(.dark)
//            .previewDisplayName("dark")
//
//        DistrictsView(viewModel: LocationViewModel(locations: [Location(name: "", services: [""], coordinates: CLLocationCoordinate2D(latitude: 42.3319, longitude:  -83.0466), imageNames: [""], link: "")]))
//            .environmentObject(DistrictsViewModel())
//            .previewDevice("iPhone 14 Pro")
//            .previewDisplayName("14 pro")
//
//        DistrictsView(viewModel: LocationViewModel(locations: [Location(name: "", services: [""], coordinates: CLLocationCoordinate2D(latitude: 42.3319, longitude:  -83.0466), imageNames: [""], link: "")]))
//            .environmentObject(DistrictsViewModel())
//            .previewDevice("iPhone 13")
//            .previewDisplayName("13")
    }
}

// A Continuation of the DistrictsView Struct
extension DistrictsView {
    private var header: some View {
        HStack(alignment: .top) {
            VStack {
                #warning("Make drop down list smaller.")
                // District Drop Down List Button
                Button(action: vm.toggleDistrictsList) {
                    Text(vm.mapLocation.name)
                        .font(.system(size: 35))
                        .minimumScaleFactor(0.5)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .padding(.leading, 55)
                        .overlay(alignment: .leading) {
                            Image(systemName: "chevron.down")
                                .font(.system(size: 25))
                                .minimumScaleFactor(0.5)
                                .foregroundColor(.primary)
                                .padding()
                                .padding(.trailing)
                                .rotationEffect(Angle(degrees: vm.showDistrictsList ? 180 : 0))
                        }
                }
                
                if vm.showDistrictsList {
                    DistrictsListView()
                }
                
            }
            .background(.thickMaterial)
            .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
//            Spacer()
        }
    }
}


// Blurred View Here
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // do nothing
    }
}



