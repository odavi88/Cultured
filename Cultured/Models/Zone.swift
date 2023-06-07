//
//  Area.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/4/23.
//

import Foundation
import CoreLocation


// NOTE: AREA is a stand-in for Districts

struct Zone: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
//    let task: [Task]
    var percentage: Double = 0.0
}
