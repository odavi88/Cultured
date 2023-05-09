//
//  DiscoveredLocationView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/7/23.
//

import SwiftUI

struct DiscoveredLocationView: View {
    @EnvironmentObject private var vm: DistrictsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    // MARK: Loop through each photo here
                    Image("midwayHoopPic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    //MARK: Loop through names here?
                    Text("Monroe Street Midway")
                        .font(.title).fontWeight(.medium)
                }
                
                Spacer()
                Button {
                    // some code here
                } label: {
                    Text("Completed!")
                        .padding()
                        .foregroundColor(.white)
                        .background(
                        RoundedRectangle(cornerRadius: 20)
                        )
                }
            }
            // MARK: loop through Location Names Here?
            .navigationTitle("Discovered Location")
            #warning("Find out if we can loop through Location Names")
        }
    }
}

struct DiscoveredLocationView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveredLocationView()
    }
}
