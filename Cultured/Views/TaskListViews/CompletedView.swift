//
//  CompleteButtonView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/7/23.
//

import SwiftUI

struct CompletedView: View {
    var body: some View {
        VStack {
            Text("Completed!")
                .font(.title)
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.blue)
                .padding()
            Spacer()
        }
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
    }
}
