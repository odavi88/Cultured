//
//  AllDialsView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/3/23.
//

import SwiftUI

struct AllDialsView: View {
    
    @State var district1Completion: Double = 0.50
    
    var body: some View {
        VStack {
            DetroitDialView(progressPercent: district1Completion)
            
//            Text("Districts")
//                .font(.title2)
//                .padding(.top, 50)
//                .padding(.bottom)
            
            #warning("Get help with this crash here!")
//                DistrictDialsView()

            Spacer()
            
        }
        .padding(.top, 26)
    }
}

struct AllDialsView_Previews: PreviewProvider {
    static var previews: some View {
        AllDialsView()
    }
}
