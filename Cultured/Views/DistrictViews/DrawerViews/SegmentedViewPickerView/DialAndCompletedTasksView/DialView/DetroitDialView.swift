//
//  DetroitDialView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

struct DetroitDialView: View {
    @StateObject private var vm = DistrictsViewModel()
    
    @State var progressPercent: Double
    
    var body: some View {
        VStack {
            //            ZStack {
            //                Circle().stroke(Color.accentColor.opacity(0.5), lineWidth: 15)
            //                    .frame(width: 150, height: 150)
            //                Circle().trim(from: 0, to: 0.0).stroke(Color.accentColor, lineWidth: 15)
            //                    .frame(width: 150, height: 150)
            //                    .rotationEffect(.degrees(-90))
            //                Text("0%")
            //                    .font(.subheadline)
            //            }
            
            CircularProgressView(progress: vm.progress)
            //                .padding(65)
            
            Text("Total")
                .font(.title)
        }
    }
}


struct CircularProgressView: View {
    var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: -90))
            
            Text("")
                .font(.headline)
            
            
            //        ZStack {
            //            Circle().stroke(Color.accentColor.opacity(0.5), lineWidth: 15)
            //                .frame(width: 250, height: 250)
            //            Circle().trim(from: 0.0, to: progress).stroke(Color.accentColor, lineWidth: 15)
            //                .frame(width: 250, height: 250)
            //                .rotationEffect(.degrees(-90))
            //            Text("0%")
            //                .font(.subheadline)
            //        }
        }
    }
}


struct DetroitDialView_Previews: PreviewProvider {
    static var previews: some View {
        DetroitDialView(progressPercent: 1.0)
    }
}
