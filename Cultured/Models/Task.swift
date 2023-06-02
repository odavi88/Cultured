//
//  Task.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import Foundation


struct Task: Identifiable, Equatable {
    let id = UUID()
    let description: String
    let imageName: String
    var isCompleted: Bool = false
}
