//
//  PendingTaskListView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

struct PendingTaskListView: View {
    @ObservedObject var vm: DistrictsViewModel
    var body: some View {
        NavigationView {
                List {
                    ForEach(vm.tasks, id: \.self) { task in
                        HStack(alignment: .top) {
                            Text(task.description)
                            Spacer()
                            Button(action: {
                                    vm.completeTask(task: task)
                            }) {
                                Text("Search")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding()
                    }
                }
                .navigationTitle("Activities")
        }
    }
}

struct PendingTaskListView_Previews: PreviewProvider {
    static var previews: some View {
        PendingTaskListView(vm: DistrictsViewModel())
    }
}

