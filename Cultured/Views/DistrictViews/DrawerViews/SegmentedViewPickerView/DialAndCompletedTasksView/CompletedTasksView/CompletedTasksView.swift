//
//  CompletedTasksView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

struct CompletedTasksView: View {
    @ObservedObject var vm: DistrictsViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.completedTasks, id: \.self) { task in
                    HStack {
                        Text(task.description)
                    }
                }
            }
            .navigationTitle("Completed")
        }
    }
}
struct CompletedTasksView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasksView(vm: DistrictsViewModel())
    }
}
