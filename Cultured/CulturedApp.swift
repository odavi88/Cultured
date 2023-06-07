//
//  CulturedApp.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/27/23.
//

import SwiftUI
import CoreLocation

@main
struct CulturedApp: App {
    
    @StateObject var vm = DistrictsViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
//                DynamicTextFix()
                DistrictsView()
                    .environmentObject(vm)
            }
        }
    }
}

