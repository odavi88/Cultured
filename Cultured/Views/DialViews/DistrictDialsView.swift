//
//  DistrictDialsView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/3/23.
//

import SwiftUI

struct DistrictDialsView: View {
    @EnvironmentObject private var vm: DistrictsViewModel
    var body: some View {
        
        HStack(spacing: 20) {
            ForEach(vm.districts) { districts in
                VStack(spacing: 20) {
                    ZStack {
                        Circle().stroke(Color.accentColor.opacity(0.5), lineWidth: 15)
                            .frame(width: 90, height: 90)
                        Circle().trim(from: 0, to: 0.15).stroke(Color.accentColor, lineWidth: 15)
                            .frame(width: 90, height: 90)
                            .rotationEffect(.degrees(-90))
                        Text("\(districts.percentage)%")
                            .font(.system(size: 20, weight: .medium))
                            .minimumScaleFactor(0.5)
                    }
                    Text(districts.name)
                        .font(.system(size: 20, weight: .medium))
                        .minimumScaleFactor(0.5)
                        
                }
            }
        }
    }
}

struct DistrictDialsView_Previews: PreviewProvider {
    static var previews: some View {
        DistrictDialsView()
            .environmentObject(DistrictsViewModel())
    }
}
