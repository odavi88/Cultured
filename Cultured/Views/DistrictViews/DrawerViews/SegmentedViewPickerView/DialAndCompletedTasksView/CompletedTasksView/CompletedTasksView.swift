//
//  CompletedTasksView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

struct CompletedTasksView: View {
    @EnvironmentObject var vm: DistrictsViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.completedTasks) { task in
                    Text(task.description)
                }
            }
            .navigationTitle("Completed")
        }
    }
}
struct CompletedTasksView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasksView()
            .environmentObject(DistrictsViewModel())
    }
}
