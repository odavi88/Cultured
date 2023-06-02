//
//  DialAndCompletedTaskView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

struct DialAndCompletedTaskView: View {
    var body: some View {
        VStack {
            DetroitDialView(progressPercent: 1.0)
                .padding(.top, 40)
            Spacer()
            CompletedTasksView()
        }
    }
}

struct DialAndCompletedTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DialAndCompletedTaskView()
    }
}
