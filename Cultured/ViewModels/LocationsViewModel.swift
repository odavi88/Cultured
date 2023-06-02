//
//  LocationsViewModel.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/27/23.
//

//import Foundation
//import SwiftUI
//import MapKit
//
//class DistrictsViewModel: ObservableObject {
//    
//    let districtDataService = DistrictDataService()
//    
//    // All Loaded Districts
//    @Published var districts: [District]
//    
//    // Array to House the Locations or the Marker Pins
//    @Published var location: [Location] = []
//    
//    var completedLocations: [Location] {
//        location.filter {
//            $0.hasVisited
//        }
//    }
//    
//    // To Show Map Markers
//    @Published var showMarkers = true
//    
//    // Current District on the Map
//    @Published var mapLocation: District {
//        didSet {
//            updateMapRegion(district: mapLocation)
//        }
//    }
//    
//    // Current Region On Map
//    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
//    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.049, longitudeDelta: 0.015)
//    
//    
//    // Show list of Districts
//    @Published var showDistrictsList: Bool = false
//    
//    // Navigation between Map and Tasks List
//    @Published var showTaskListView = false
//    
//    @Published var showProgressView = false
//    
//    init() {
//        // add annotations here
//        let districts = DistrictDataService.districts
//        let districtsFetch = districtDataService.fetchDistricts()
//        self.districts = districts
//        self.mapLocation = districts.first! // It is okay to explicitly unwrap this because we know there will always be hard coded data
//        self.updateMapRegion(district: districts.first!)
//    }
//    
//    private func updateMapRegion(district: District) {
//        withAnimation(.easeInOut) {
//            mapRegion = MKCoordinateRegion(
//                center: district.coordinates,
//                span: mapSpan)
//        }
//    }
//    
//    func toggleDistrictsList() {
//        
//        withAnimation(.easeInOut) {
//            showDistrictsList.toggle()
//        }
//        
//    }
//    
//    func showNextDistrict(district: District) {
//        withAnimation(.easeInOut) {
//            mapLocation = district
//            showDistrictsList = false
//        }
//    }
//    
//    func toggleMarkers() {
//        showMarkers.toggle()
//    }
//}
//
//
//
//
//
//
//
//class LocationViewModel: ObservableObject {
//    // All Loaded Locations
//    @Published var locations: [Location]
//    
//    var allLocations: [Location] {
//        [
//            Location(name: "Milk & Froth", services: ["Ice Cream"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//            Location(name: "Huddle Soft Ice Cream", services: ["Ice Cream"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//            Location(name: "Detroit Water Ice Factory", services: ["Ice Cream"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//            Location(name: "Nikki's Pizza", services: ["Pizza"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//            Location(name: "The Skip", services: ["Drinks"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//        ]
//    }
//    
//    // Array of location markers by coordinate
//    @Published var markers: [Location] = []
//    
//    @Published var mapLocation: Location {
//        didSet {
//            updateMapLocation(location: mapLocation)
//        }
//    }
//    
//    @Published var percentage: Double = 0.0
//    
//    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
//    let mapSpan = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 80.0)
//    
//    // Show list of Tasks
//    @Published var showTaskList: Bool = false
//    
//    init(locations: [Location]) {
//        self.locations = locations
//        self.mapLocation = locations.first! // It is okay to explicitly unwrap this because we know there will always be hard coded data
//        self.percentage = percentage
//    }
//    
////    let iceCreamShops = locations.filter {
////    $0.services.contains("ice cream")
////    }
//    
//    private func updateMapLocation(location: Location) {
//        withAnimation(.easeInOut) {
//            mapRegion = MKCoordinateRegion(
//                center: location.coordinates,
//                span: mapSpan)
//        }
//    }
//    
//    func toggleDistrictsList() {
//        withAnimation(.easeInOut) {
//            showTaskList.toggle()
//        }
//    }
//    
//    func showNextTask(location: Location) {
//        withAnimation(.easeInOut) {
//            mapLocation = location
//            showTaskList = false
//        }
//        
//        // function makes the markers show up on the map
//        
//        func toggleMarker(for location: Location) {
//            if let index = markers.firstIndex(where: { $0.id == location.id }) {
//                markers.remove(at: index)
//            } else {
//                markers.append(location)
//            }
//        }
//        
//        func calculatePercentage() {
//            
//        }
//        
//        
//    }
//}
