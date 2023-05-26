//
//  SuggestionsListView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/22/23.
//

import SwiftUI

struct SuggestionsListView: View {
    @State private var searchText = ""
    
//    let poi = [PointOfInterests.poi]
//
//    var filteredItems: [PointOfInterests] {
//        if searchText.isEmpty {
//            return poi
//        } else {
//            return poi.filter { $0.localizedCaseInsensitiveContains(searchText) }
//        }
        
        var body: some View {
            NavigationStack {
                TextField("search", text: $searchText)
                    .padding([.leading, .trailing])
                    .textFieldStyle(.roundedBorder)
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(PointOfInterests.poi) { poi in
                            HStack(alignment: .top, spacing: 40) {
                                Image(poi.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 100)
                                    .cornerRadius(10)
                                VStack(alignment: .leading, spacing: 1) {
                                    Text(poi.name)
                                        .font(.headline)
                                    Text(poi.description)
                                        .font(.caption)
                                    Text(poi.address)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                    }
                }
                .navigationTitle("Points Of Interest")
            }
        }
    }
//}

struct SuggestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionsListView()
    }
}


// MARK: For Suggested List View
struct PointOfInterests: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let description: String
    let address: String
    
    static var poi: [PointOfInterests] = [
        PointOfInterests(imageName: "nikisDetPizzaPic", name: "Nikki's Pizza", description: "Info about Nikki's pizza.", address: "Address here"),
        PointOfInterests(imageName: "midwayHoopPic", name: "Monroe on Midway", description: "Park", address: "Address here"),
        PointOfInterests(imageName: "parcPic", name: "Parc", description: "Restaurant", address: "Address here"),
        PointOfInterests(imageName: "empachoPic", name: "Empacho", description: "Argentinian Street Food", address: "Address here")
    ]
    
    init(imageName: String, name: String, description: String, address: String) {
        self.imageName = imageName
        self.name = name
        self.description = description
        self.address = address
    }
}
