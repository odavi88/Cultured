//
//  TaskListPtactice.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/9/23.
//

import SwiftUI

struct Name {
    let name: String
}



struct TaskListPractice: View {
    var names: [Name] = [
    
    ]
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                ForEach(names.indices) { name in
                    HStack {
                        Image(systemName: "circle")
                        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
    }
}

struct TaskListPractice_Previews: PreviewProvider {
    static var previews: some View {
        TaskListPractice()
    }
}
