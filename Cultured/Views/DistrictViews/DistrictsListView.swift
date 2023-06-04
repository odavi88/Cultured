//
//  LocationsListView.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/27/23.
//

import SwiftUI

struct DistrictsListView: View {
    @EnvironmentObject private var vm: DistrictsViewModel
//    @EnvironmentObject private var viewModel: LocationViewModel
    var body: some View {
        List {
            ForEach(vm.districts) { district in
                Button {
                    vm.showNextDistrict(district: district)
                } label: {
                    listRowView(district: district)
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
    private func listRowView(district: District) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(district.name)
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
