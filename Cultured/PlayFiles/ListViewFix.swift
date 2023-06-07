//
//  ListViewFix.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/5/23.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let imageName: String
    let itemDescription: String
}

struct ItemListView: View {
    let items = [
        Item(imageName: "item1", itemDescription: "Item 1"),
        Item(imageName: "item2", itemDescription: "Item 2"),
        Item(imageName: "item3", itemDescription: "Item 3"),
        // Add more items as needed
    ]
    
    var body: some View {
        List(items) { item in
            HStack {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 50, height: 50) // Adjust the size as needed
                
                Text(item.itemDescription)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct ListView: View {
    var body: some View {
        ItemListView()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
