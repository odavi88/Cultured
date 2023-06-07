//
//  TabBarView.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/28/23.
//

//import SwiftUI
//
///*
// Make each of the buttons into navigations links and make them go to the right views
// 
// */
//
//struct BottomSheetPreferenceKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value = nextValue()
//    }
//}
//
//struct TabButtonsView: View {
//    @EnvironmentObject private var vm: DistrictsViewModel
//    @State private var isBottomSheetVisible = false
//    @State private var bottomSheetHeight: CGFloat = 0
//    
//    var body: some View {
//        
//        VStack {
//            VStack(spacing: 10) {
//                Button(action: {
//                    vm.showTaskListView = true
//                }) {
//                    Image(systemName: "list.clipboard")
//                        .font(.system(size: 30))
//                        .minimumScaleFactor(0.5)
//                        .padding()
//                        .background(.thinMaterial)
//                        .cornerRadius(10)
//                }
//                // MARK: Sheet view here
//                // NOTe: .sheet(isPresented: .constant(true)... to make sheet constant
//                .sheet(isPresented: $vm.showTaskListView) {
////                    ZoneListView()
//                        .presentationDetents([.height(340), .large])
////                        .presentationDetents([.medium])
//                }
//                
//                VStack(spacing: 10) {
//                    Button(action: {
//                        vm.showProgressView = true
//                    }) {
//                        Image(systemName: "trophy")
//                            .foregroundColor(.primary)
//                            .font(.system(size: 30))
//                            .minimumScaleFactor(0.5)
//                            .padding()
//                            .background(.thinMaterial)
//                            .cornerRadius(10)
//                    }
//                    .sheet(isPresented: $vm.showProgressView) {
//                       DistrictDialsView()
//                            .presentationDetents([.medium, .large])
//                    }
//                }
//                
//                Button(action: {
//                    SuggestionsListView()
//                }) {
//                    Image(systemName: "building.2.crop.circle")
//                        .font(.system(size: 30))
//                        .minimumScaleFactor(0.5)
//                        .padding()
//                        .background(.thinMaterial)
//                        .cornerRadius(10)
//                }
//            }
//            .foregroundColor(.primary)
//            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
//        }
//    }
//}
//
//
//
//struct TabButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButtonsView()
//            .environmentObject(DistrictsViewModel())
//    }
//}
