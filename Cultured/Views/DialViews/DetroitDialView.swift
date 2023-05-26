//
//  ProgressDialView.swift
//  Cultured
//
//  Created by Omar Davidson II on 4/28/23.
//

import SwiftUI

struct DetroitDialView: View {
    
    @State var progressPercent: Double

    var body: some View {
        VStack {
            ZStack {
                Circle().stroke(Color.accentColor.opacity(0.5), lineWidth: 15)
                    .frame(width: 150, height: 150)
                Circle().trim(from: 0, to: 0.0).stroke(Color.accentColor, lineWidth: 15)
                    .frame(width: 150, height: 150)
                    .rotationEffect(.degrees(-90))
                Text("0%")
                    .font(.subheadline)
            }
            
            Text("Detroit")
                .font(.title)
        }
    }
}

struct DetroitDialView_Previews: PreviewProvider {
    static var previews: some View {
        DetroitDialView(progressPercent: 1.0)
    }
}
