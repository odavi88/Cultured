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
    @ObservedObject var viewModel: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion, annotationItems: viewModel.locations, annotationContent: { location in
                MapMarker(coordinate: location.coordinates)
            })
                .ignoresSafeArea()
            VStack {
                header
                    .padding()
                Spacer()
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        DistrictsView(viewModel: LocationViewModel(locations: [Location(name: "", locationType: .landmark, coordinates: CLLocationCoordinate2D(latitude: 42.3319, longitude:  -83.0466), imageNames: [""], link: "")]))
            .environmentObject(DistrictsViewModel())
    }
}

// A Continuation of the DistrictsView Struct
extension DistrictsView {
    private var header: some View {
        HStack(alignment: .top) {
            VStack {
                // District Drop Down List Button
                Button(action: vm.toggleDistrictsList) {
                    Text(vm.mapLocation.name)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .overlay(alignment: .leading) {
                            Image(systemName: "chevron.down")
                                .font(.title3)
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
            
                        TabButtonsView()
            
            Spacer()
            // Tab Bar will go here
//            TabBarView()
        }
    }
}


//import Foundation
//
//let headers = ["accept": "application/json"]
//
//
//let location = "Detroit"
//
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://api.yelp.com/v3/businesses/search?location=\(location)&term=food&categories=&sort_by=best_match&limit=20")! as URL,
//                                        cachePolicy: .useProtocolCachePolicy,
//                                    timeoutInterval: 10.0)
//request.httpMethod = "GET"
//request.allHTTPHeaderFields = headers
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//  if (error != nil) {
//    print(error as Any)
//  } else {
//    let httpResponse = response as? HTTPURLResponse
//    print(httpResponse)
//  }
//})
//
//dataTask.resume()
