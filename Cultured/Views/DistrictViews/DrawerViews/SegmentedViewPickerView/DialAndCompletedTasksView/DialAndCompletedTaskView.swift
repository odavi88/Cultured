//
//  DialAndCompletedTaskView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

struct DialAndCompletedTaskView: View {
    @EnvironmentObject var vm: DistrictsViewModel
    var body: some View {
        VStack {
            DetroitDialView(vm: DistrictsViewModel())
                .padding(.top)
            Spacer()
//            CompletedTasksView()
        }
    }
}

struct DialAndCompletedTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DialAndCompletedTaskView()
    }
}
