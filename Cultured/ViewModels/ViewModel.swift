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
    
    //MARK: Place to house API Data?
    //    let districtDataService = DistrictDataService()
    
    
    // MARK: Map Zones
    
    @Published var zones: [Zone] = [
        // MARK: GM Plaza Zone
        Zone(name: "Water Front", coordinate: CLLocationCoordinate2D(latitude: 42.328324, longitude: -83.039265)),
        // MARK: Campus Martius Zone
        Zone(name: "Campus Martius", coordinate: CLLocationCoordinate2D(latitude: 42.331545, longitude: -83.046635)),
        // MARK: Capitol Park Zone
        Zone(name: "Capitol Park", coordinate: CLLocationCoordinate2D(latitude: 42.332899, longitude: -83.049526)),
        // MARK: The Grand Circus Park
        Zone(name: "Grand Circus Park", coordinate: CLLocationCoordinate2D(latitude: 42.336304, longitude: -83.051291)),
        // MARK: The Belt Zone
        Zone(name: "The Belt", coordinate: CLLocationCoordinate2D(latitude: 42.334632, longitude: -83.046622)),
        // MARK: St. Mary's Zone
        Zone(name: "St. Mary's", coordinate: CLLocationCoordinate2D(latitude: 42.335556, longitude: -83.040484)),
        // MARK: At Water Zone
        Zone(name: "At Water", coordinate: CLLocationCoordinate2D(latitude: 42.336556, longitude: -83.019315)),
    ]
    
    @Published var completionPercentageColor: Double = 0.0
    
    // Current Region On Map
    //    @Published var mapRegion: MKCoordinateRegion
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    @Published var tasks: [Task] = [
        Task(description: "", imageName: ""),
    ]
    
    var completionPercentage: Double {
        var completeTasks = tasks.filter { $0.isCompleted }
        let percentage = Double(completedTasks.count) / Double(tasks.count)

        return percentage / 100
    }
    
    
    
    var progressColor: Color {
        switch completionPercentage {
        case 0.0..<09.0:
            return .black
        case 10.0..<19.0:
            return .indigo
        case 20.0..<29.0:
            return .blue
        case 30.0..<39.0:
            return .purple
        case 40.0..<49.0:
            return .red
        case 50.0..<59.0:
            return .lightRed
        case 60.0..<69.0:
            return .pink
        case 70.0..<79.0:
            return .cyan
        case 80.0..<89.0:
            return .mint
        case 90.0..<99.0:
            return .mint
        case 100.0...100.0:
            return .green
        default:
            return .clear
        }
    }
//        case 0.0..<09.0:
//            return .black
//        case 10.0..<19.0:
//            return .indigo
//        case 20.0..<29.0:
//            return .blue
//        case 30.0..<39.0:
//            return .purple
//        case 40.0..<49.0:
//            return .red
//        case 50.0..<59.0:
//            return .lightRed
//        case 60.0..<69.0:
//            return .pink
//        case 70.0..<79.0:
//            return .cyan
//        case 80.0..<89.0:
//            return .mint
//        case 90.0..<99.0:
//            return .mint
//        case 100.0...100.0:
//            return .green
//        default:
//            return .clear
    
    
    // MARK: Completed TaskListView
    @Published var completedTasks: [Task] = []
    
    // MARK: Refers to Dial's Progress
    @Published var progress: Double = 100.0
    
    //MARK: Current Shown Area on the Map
    @Published var mapLocation: Zone {
        didSet {
            updateMapRegion(zone: mapLocation)
        }
    }
    
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
    
    
    // Show list of Districts
    @Published var showZonesList: Bool = false
    
    // Navigation between Map and Tasks List
    @Published var showTaskListView = false
    
    //     Shows Progress Dials
    @Published var showProgressView = true
    
    // Show Location Options
    //    @Published var showOptions = false
    
    // MARK: For Selected Views Segmented Picker
    @Published var selectedViewCategory: ViewCategories = .activities
    
    
    init() {
        
        let initialCoordinate = CLLocationCoordinate2D(latitude: 42.327119, longitude: -83.044077)
        // MARK: InitialCoodinate's Span
        let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
        
        self.mapRegion = MKCoordinateRegion(center: initialCoordinate, span: span)
        self.tasks = [
            Task(description: "Eat pizza from a local restaurant.", imageName: "nikisDetPizzaPic"),
            Task(description: "Purchase a chai latte.", imageName: "lattePic"),
            Task(description: "Try seafood dish.", imageName: "salmonDishPic"),
            Task(description: "Enjoy a walk along the river.", imageName: "detWalkingPathPic"),
            Task(description: "Take a selfie with the Joe Louis's Fist.", imageName: "joeLouisFistPic"),
            Task(description: "Take a selfie at a mural.", imageName: "birdMuralCTPic"),
            Task(description: "Go roller skating.", imageName: "rollerSkatingPic"),
            Task(description: "Drink something with alcohol in it or its NA version.", imageName: "drinkPic"),
            Task(description: "Score some buckets.", imageName: "outdoorBasketBallRimPic"),
            Task(description: "Take a selfie with Detroit Skyline.", imageName: "detSkylinePic"),
            Task(description: "Enjoy some ice cream.", imageName: "iceCreamPic"),
            Task(description: "Take a selfie with the Spirit of Detroit.", imageName: "spiritOfDetroitPic"),
//            Task(description: "Go on a carousel.", imageName: "detCarouselPic"),
//            Task(description: "Take in Some Art Deco Architecture.", imageName: "guardianBuildingPic"),
//            Task(description: "Go there.", imageName: ""),
//            Task(description: "Enjoy that.", imageName: ""),
//            Task(description: "Be over there.", imageName: ""),
        ]
        self.completedTasks = []
        self.progress = 0.0
        self.mapLocation = Zone(name: "", coordinate: CLLocationCoordinate2D())
        self.showZonesList = false
        self.showTaskListView = false
        self.showProgressView = false
        self.selectedViewCategory = ViewCategories.activities
    }
    
    private func updateMapRegion(zone: Zone) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: zone.coordinate,
                span: mapSpan)
        }
    }
    
    // MARK: Select Zone
    func selectZone(_ zone: Zone) {
        mapRegion = MKCoordinateRegion(center: zone.coordinate, span: mapRegion.span)
    }
    
    func toggleDistrictsList() {
        withAnimation(.easeInOut) {
            showZonesList.toggle()
        }
    }
    
    func showNextZone(zone: Zone) {
        withAnimation(.easeInOut) {
            mapLocation = zone
            showZonesList = false
        }
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

