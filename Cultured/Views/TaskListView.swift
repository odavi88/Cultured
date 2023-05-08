//
//  TaskListView.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/29/23.
//

import SwiftUI


#warning("Figure out how to make this TaskListView and AllDialView be the same page.")

struct TaskListView: View {
    @EnvironmentObject private var vm: DistrictsViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.districts) { district in
                    Section(district.name) {
                        ForEach(district.tasks) { task in
                            HStack(alignment: .top, spacing: 15) {
                                Image(task.taskImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                VStack(alignment: .leading, spacing: 25) {
                                    Text(task.description)
                                    HStack(spacing: 20) {
                                        
                                        NavigationLink(destination:  LocaleSuggestionsView()) {
                                            TaskRowView()
                                        }
//                                        NavigationLink {
//                                            LocaleSuggestionsView()
//                                        } label: {
//                                            Text("Suggestions")
//                                                .padding(.vertical, 15)
//                                                .padding(.horizontal, 5)
//                                                .foregroundColor(.black)
//                                                .background(
//                                                    Color.accentColor
//                                                )
//                                                .cornerRadius(15)
////                                        }
//                                        .buttonStyle(PlainButtonStyle())
                                        
                                        NavigationLink {
                                            DiscoveredLocationView()
                                        } label: {
                                            Text("Discovered!")
                                                .padding(.vertical, 15)
                                                .padding(.horizontal, 5)
                                                .foregroundColor(.black)
                                                .background(
                                                    Color(uiColor: .systemGray5)
                                                )
                                                .cornerRadius(15)
                                        } .buttonStyle(PlainButtonStyle())
//                                        SuggestedButtonView()
//                                        DiscoveredButtonView()
                                    }
                                }
                                
                            }
                            Divider()
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .navigationTitle("Tasks") // "Downtown Tasks etc."
        }
        
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .environmentObject(DistrictsViewModel())
    }
}

