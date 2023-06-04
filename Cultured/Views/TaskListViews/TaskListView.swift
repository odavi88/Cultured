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
//    @EnvironmentObject private var viewModel: LocationViewModel
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                //                DistrictPickerView()
                ForEach(vm.districts) { district in
                    ForEach(district.tasks) { task in
                        HStack(alignment: .top, spacing: 15) {
                            Image(task.taskImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 100)
                                .cornerRadius(10)
                                .shadow(radius: 5, x: 2, y: 4)
                            Spacer()
                            VStack(alignment: .leading, spacing: 7) {
                                Text(task.description)
                                    .font(.system(size: 20))
                                    .minimumScaleFactor(0.5)
                                HStack {
                                    Button {
//                                        viewModel.toggleMarker(for: location)
                                    } label: {
                                        Text("Complete")
                                            .minimumScaleFactor(0.5)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 10)
                                            .foregroundColor(.white)
                                            .background(
                                                Color.accentColor
                                            )
                                            .cornerRadius(9)
                                    }
//                                    .buttonStyle(PlainButtonStyle())
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding()
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Activities") // "Downtown Tasks etc."
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}





struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .environmentObject(DistrictsViewModel())
    }
}

