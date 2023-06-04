//
//  SegmentedPickerView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

struct SegmentedPickerView: View {
    @StateObject private var vm = DistrictsViewModel()
    var body: some View {
        VStack {
            Picker("Category", selection: $vm.selectedViewCategory) {
                ForEach(ViewCategories.allCases, id: \.self) { category in
                    Text(category.rawValue.capitalized)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if vm.selectedViewCategory == .activities {
                PendingTaskListView()
                    .padding(.top, 0)
            } else if vm.selectedViewCategory == .completed {
                CompletedTasksView()
            } else if vm.selectedViewCategory == .progress {
                DetroitDialView(vm: vm)
                Spacer()
                
            }
        }
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPickerView()
            .environmentObject(DistrictsViewModel())
        
    }
}

