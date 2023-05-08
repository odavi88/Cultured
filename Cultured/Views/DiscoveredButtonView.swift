//
//  CompleteButtonView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/7/23.
//

import SwiftUI

struct DiscoveredButtonView: View {
    var body: some View {
        Button(action: {
            DiscoveredLocationView()
        }, label: {
            Text("Discovered!")
                .padding(.vertical, 15)
                .padding(.horizontal, 5)
                .foregroundColor(.black)
                .background(
                    Color(uiColor: .systemGray5)
                )
                .cornerRadius(15)
        })
    }
}

struct DiscoveredButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveredButtonView()
    }
}
