//
//  TabBarView.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/28/23.
//

import SwiftUI

/*
 Make each of the buttons into navigations links and make them go to the right views
 
 */

struct TabButtonsView: View {
    @EnvironmentObject private var vm: DistrictsViewModel
    var primaryColor = Color(uiColor: .black)
    var accentColor = Color(uiColor: .blue)
    @State private var buttonIsPressed = false
    
    var body: some View {
        
        VStack {
            
            VStack(spacing: 10) {
                Button(action: {
                    vm.showTaskListView = true
                }) {
                    Image(systemName: "list.clipboard")
                        .font(.title3)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                }
                // MARK: Sheet view here
                // NOTe: .sheet(isPresented: .constant(true)... to make sheet constant
                .sheet(isPresented: $vm.showTaskListView) {
                    TaskListView()
                        .presentationDetents([.height(340), .large])
//                        .presentationDetents([.medium])
                }
                
                VStack(spacing: 10) {
                    Button(action: {
                        vm.showProgressView = true
                    }) {
                        Image(systemName: "trophy")
                            .foregroundColor(buttonIsPressed == true ? accentColor : primaryColor)
                            .font(.title3)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $vm.showProgressView) {
                        AllDialsView()
                            .presentationDetents([.medium, .large])
                    }
                }
            }
            .foregroundColor(.primary)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
            
            
            //        VStack {
            //            Button(action: {
            //                vm.showTaskListView = true
            //            }) {
            //                VStack(alignment: .center, spacing: 4) {
            //                    Image(systemName: "list.clipboard")
            //                        .font(.title)
            //                    Text("Tasks")
            //                        .font(Font.subheadline)
            //                }
            //                .foregroundColor(.primary)
            //            }
            //            .sheet(isPresented: $vm.showTaskListView) {
            //                TaskListView()
            //            }
            //
            //            Button(action: {
            //                vm.showProgressView = true
            //            }) {
            //                VStack {
            //                    Image(systemName: "trophy")
            //                        .font(.title)
            //                    Text("Progress")
            //                        .font(Font.subheadline)
            //                }
            //                .foregroundColor(.primary)
            //
            //            }
            //            .sheet(isPresented: $vm.showProgressView) {
            //                AllDialsView()
            //            }
            //        }
            //        .frame(height: 82)
            //        .background(.thickMaterial)
            //        .cornerRadius(10)
            //        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
            //    }
            //
            //}
        }
    }
}



struct TabButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TabButtonsView()
            .environmentObject(DistrictsViewModel())
    }
}
