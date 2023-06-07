//
//  LocationsListView.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/27/23.
//

import SwiftUI

struct DistrictsListView: View {
    @EnvironmentObject var vm: DistrictsViewModel
    @ScaledMetric var fontSize: CGFloat = 17 // Default font size
    var body: some View {
        List {
            ForEach(vm.zones) { zone in
                Button {
                    vm.showNextZone(zone: zone)
                } label: {
                    listRowView(zone: zone)
                }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(.grouped)
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        DistrictsListView()
            .environmentObject(DistrictsViewModel())
    }
}


extension DistrictsListView {
    private func listRowView(zone: Zone) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(zone.name)
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.5)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            // makes all of the text the same width
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
