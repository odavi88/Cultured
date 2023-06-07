//
//  LocationsSectionListView.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/28/23.
//

//import SwiftUI
//
//struct LocationsTabListView: View {
//    @EnvironmentObject private var vm: DistrictsViewModel
//    
//    var body: some View {
//        List {
//            Section(header: Text("Districts")) {
//                ForEach(vm.districts) { district in
//                    
//                    Button {
//                        
//                    } label: {
//                        listRowView(district: district)
//                    }
//                }
//            }
//        }
//        .listStyle(.insetGrouped)
//    }
//    
//    struct LocationsSectionListView_Previews: PreviewProvider {
//        static var previews: some View {
//            LocationsTabListView()
//                .environmentObject(DistrictsViewModel())
//        }
//    }
//}
//
//
//extension LocationsTabListView {
//    private func listRowView(district: District) -> some View {
//        
//        HStack(alignment: .top, spacing: 15) {
//            
//            // MARK: Images here?
//            
////            if let imageName = district.imageNames.first {
////                Image(imageName)
////                    .resizable()
////                    .scaledToFill()
////                    .frame(width: 45, height: 45)
////                    .cornerRadius(10)
////            }
//            Text(district.name)
////            Text(district.tasks)
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .foregroundColor(.primary)
//    }
//}
