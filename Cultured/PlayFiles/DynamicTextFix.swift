//
//  DynamicTextFix.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/6/23.
//

import SwiftUI

struct DynamicTextFix: View {
    @ScaledMetric var fontSize: CGFloat = 17 // Default font size
    var body: some View {
        List {
            HStack(alignment: .center, spacing: 15) {
                Image("drinkPic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.system(size: fontSize))
                    .minimumScaleFactor(0.5) // Adjust as needed
                .lineLimit(1)
            }
        } // Adjust as needed
    }
}

struct DynamicTextFix_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextFix()
    }
}
