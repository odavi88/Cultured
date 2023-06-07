//
//  DetroitDialView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

struct DetroitDialView: View {
    @ObservedObject var vm: DistrictsViewModel
    
//    @State var progressPercent: Double
    
    var body: some View {
        VStack {
            CircularProgressView(vm: vm)
        }
    }
}


struct CircularProgressView: View {
    @ObservedObject var vm: DistrictsViewModel
    var body: some View {
        VStack {
            Text("Downtown")
                .font(.title).bold()
                .padding(.bottom, 30)
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                Circle()
                    .trim(from: 0.0, to: CGFloat(vm.progress))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.orange)
                    .rotationEffect(Angle(degrees: -90))
                
                Text("\(Int(vm.progress * 100))%")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
            }
        }
        .padding(80)
    }
}


struct DetroitDialView_Previews: PreviewProvider {
    static var previews: some View {
        DetroitDialView(vm: DistrictsViewModel())
    }
}
