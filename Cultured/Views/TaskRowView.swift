//
//  TaskRowView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/8/23.
//

import SwiftUI

struct TaskRowView: View {
    var body: some View {
        
            Text("Suggestions")
                .padding(.vertical, 15)
                .padding(.horizontal, 5)
                .foregroundColor(.black)
                .background(
                    Color.accentColor
                )
            .cornerRadius(15)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView()
    }
}
