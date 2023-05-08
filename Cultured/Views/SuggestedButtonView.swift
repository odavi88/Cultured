//
//  SuggustedButtonView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/7/23.
//

import SwiftUI

struct SuggestedButtonView: View {
    var body: some View {
        Button(action: {
            LocaleSuggestionsView()
        }, label: {
            Text("Suggestions")
                .padding(.vertical, 15)
                .padding(.horizontal, 5)
                .foregroundColor(.black)
                .background(
                    Color.accentColor
                )
                .cornerRadius(15)
        })    }
}

struct SuggustedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedButtonView()
    }
}
