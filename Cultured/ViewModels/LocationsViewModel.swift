//
//  LocationsViewModel.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/27/23.
//

import Foundation
import SwiftUI
import MapKit

class DistrictsViewModel: ObservableObject {
    
    let districtDataService = DistrictDataService()
    
    // All Loaded Districts
    @Published var districts: [District]
    
    // Current District on the Map
    @Published var mapLocation: District {
        didSet {
            updateMapRegion(district: mapLocation)
        }
    }
    
    // Current Region On Map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.049, longitudeDelta: 0.015)

    
    // Show list of Districts
    @Published var showDistrictsList: Bool = false
    
    // Navigtaion between Map and Tasks List
    @Published var showTaskListView = false
    
    @Published var showProgressView = false
    
    init() {
        // add annotations here
        let districts = DistrictDataService.districts
//        let districts = districtDataService.fetchDistricts()
        self.districts = districts
        self.mapLocation = districts.first! // It is okay to explicitly unwrap this because we know there will always be hard coded data
        self.updateMapRegion(district: districts.first!)
    }
    
    private func updateMapRegion(district: District) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: district.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleDistrictsList() {

        withAnimation(.easeInOut) {
            showDistrictsList.toggle()
        }

    }
    
    func showNextDistrict(district: District) {
        withAnimation(.easeInOut) {
            mapLocation = district
            showDistrictsList = false
        }
    }
    #warning("Create function that toggles whether Tasks are Completed or Not.")
    func toggleCompletedTask() {
        
    }
}

class LocationViewModel: ObservableObject {
    // All Loaded Locations
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapLocation(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 80.0)
    
    // Show list of Tasks
    @Published var showTaskList: Bool = false
    
    init(locations: [Location]) {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first! // It is okay to explicitly unwrap this because we know there will always be hard coded data
    }
    
    
    
    private func updateMapLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleDistrictsList() {

        withAnimation(.easeInOut) {
            showTaskList.toggle()
        }

    }
    
    func showNextTask(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showTaskList = false
        }
    }
}
