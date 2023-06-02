//
//  Location.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/27/23.
//

import Foundation
import MapKit
import SwiftUI

#warning("Figure out how to use this Task struct to prepare the dial stuff.")

struct Location: Identifiable {
    let id = UUID()
    let name: String
    var services: [String]
    var hasVisited = false
    let coordinates: CLLocationCoordinate2D
    let imageNames: [String]
    let link: String
}

struct District: Identifiable {
    let id = UUID()
    let name: String
    let tasks: [Adventure]
    let coordinates: CLLocationCoordinate2D
    let imageNames: [String]
    var percentage: Int
}


struct Adventure: Identifiable {
    let id = UUID()
    let description: String
    let taskImage: String
    let completionPercentage: Double
    var isComplete: Bool = false
    
//    init(description: String, taskImage: String, completionPercentage: Double, isComplete: Bool) {
//        self.description = description
//        self.taskImage = taskImage
//        self.completionPercentage = completionPercentage
//    }
}



enum Districts: String, CaseIterable, Identifiable, Hashable  {
    case downtown, mexicantown, midtown

    var id: UUID {
        UUID()
    }
    var districtName: String {
        switch self {

        case .downtown:
           return "Downtown"
        case .mexicantown:
            return "Mexicantown"
        case .midtown:
            return "Midtown"
        }
    }
}


