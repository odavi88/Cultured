//
//  ViewModel.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import Foundation
import SwiftUI
import MapKit

class DistrictsViewModel: ObservableObject {
    
    let districtDataService = DistrictDataService()
    
    @Published var tasks: [Task] = [
        Task(description: "Eat pizza from a local restaurant.", imageName: ""),
        Task(description: "Purchase a chai latte.", imageName: ""),
        Task(description: "Try seafood dish.", imageName: ""),
        Task(description: "Enjoy a walk along the river.", imageName: ""),
        Task(description: "Take a selfie at a mural.", imageName: ""),
        Task(description: "Go roller skating.", imageName: ""),
        Task(description: "Score some buckets.", imageName: ""),
        Task(description: "Next activity.", imageName: ""),
        Task(description: "Another activity.", imageName: ""),
        Task(description: "Something else to do.", imageName: ""),
        Task(description: "Do this.", imageName: ""),
        Task(description: "Go there.", imageName: ""),
        Task(description: "Enjoy that.", imageName: ""),
        Task(description: "Be over there.", imageName: ""),
    ]
    
    //    @Published var completedTasks: [Task] = [] {
    //        didSet {
    //            updateProgress()
    //        }
    //    }
    
    // MARK: Completed TaskListView
    @Published var completedTasks: [Task] = []
    
    // MARK: Refers to Dial's Progress
    @Published var progress: Double = 0.0
    
    // All Loaded Districts
    @Published var districts: [District]
    
    // Array to House the Locations or the Marker Pins
    @Published var location: [Location] = []
    
    var completedLocations: [Location] {
        location.filter {
            $0.hasVisited
        }
    }
    
    // To Show Map Markers
    @Published var showMarkers = true
    
    // Current District on the Map
    @Published var mapLocation: District {
        didSet {
            updateMapRegion(district: mapLocation)
        }
    }
    
    // Current Region On Map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
    
    
    // Show list of Districts
    @Published var showDistrictsList: Bool = false
    
    // Navigation between Map and Tasks List
    @Published var showTaskListView = false
    
    //     Shows Progress Dials
    @Published var showProgressView = false
    
    // Show Location Options
    @Published var showOptions = false
    
    // MARK: For Selected Views Segmented Picker
    @Published var selectedViewCategory: ViewCategories = .activities
    
    init() {
        // add annotations here
        let districts = DistrictDataService.districts
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
    
    func toggleMarkers() {
        showMarkers.toggle()
    }
    
    //MARK: Completing a Task Here
    
    func completeTask(task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks.remove(at: index)
            completedTasks.append(task)
            progress = Double(completedTasks.count) / Double(completedTasks.count + tasks.count)
        }
    }
}
    
    
    class AdventureProgressModel: ObservableObject {
        private var adventures: [Adventure]
        
        init(adventures: [Adventure]) {
            self.adventures = adventures
        }
        
        var progress: Double {
            let completedTasksCount = adventures.filter { $0.isComplete }.count
            let totalAdventuresCount = adventures.count
            let increment: Double = 1.0 / Double(totalAdventuresCount)
            
            
            return Double(completedTasksCount) * increment
        }
        
        func updateAdventureCompletion(at index: Int, isCompleted: Bool) {
            guard index >= 0 && index < adventures.count else {
                return
            }
            adventures[index].isComplete = isCompleted
        }
    }
    
    
    
    
//    class LocationViewModel: ObservableObject {
//        // All Loaded Locations
//        @Published var locations: [Location]
//
//        var allLocations: [Location] {
//            [
//                Location(name: "Milk & Froth", services: ["Ice Cream"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//                Location(name: "Huddle Soft Ice Cream", services: ["Ice Cream"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//                Location(name: "Detroit Water Ice Factory", services: ["Ice Cream"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//                Location(name: "Nikki's Pizza", services: ["Pizza"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//                Location(name: "The Skip", services: ["Drinks"], coordinates: CLLocationCoordinate2DMake(51.1638175, 10.4478313), imageNames: [], link: ""),
//            ]
//        }
//
//        // Array of location markers by coordinate
//        @Published var markers: [Location] = []
//
//        @Published var mapLocation: Location {
//            didSet {
//                updateMapLocation(location: mapLocation)
//            }
//        }
//
//        @Published var percentage: Double = 0.0
//
//        @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
//        let mapSpan = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 80.0)
//
//        // Show list of Tasks
//        @Published var showTaskList: Bool = false
//
//        init(locations: [Location]) {
//            self.locations = locations
//            self.mapLocation = locations.first! // It is okay to explicitly unwrap this because we know there will always be hard coded data
//            self.percentage = percentage
//        }
//
//        //    let iceCreamShops = locations.filter {
//        //    $0.services.contains("ice cream")
//        //    }
//
//        private func updateMapLocation(location: Location) {
//            withAnimation(.easeInOut) {
//                mapRegion = MKCoordinateRegion(
//                    center: location.coordinates,
//                    span: mapSpan)
//            }
//        }
//
//        func toggleDistrictsList() {
//            withAnimation(.easeInOut) {
//                showTaskList.toggle()
//            }
//        }
//
//        func showNextTask(location: Location) {
//            withAnimation(.easeInOut) {
//                mapLocation = location
//                showTaskList = false
//            }
//
//            // function makes the markers show up on the map
//
//            func toggleMarker(for location: Location) {
//                if let index = markers.firstIndex(where: { $0.id == location.id }) {
//                    markers.remove(at: index)
//                } else {
//                    markers.append(location)
//                }
//            }
//
//            func calculatePercentage() {
//
//            }
//
//
//        }
//    }
//}
