//
//  BottomDrawerView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

// DrawerView Code Here
struct BottomDrawerView: View {
    @State private var offSet: CGFloat = 800
    @State private var isInitialOffsetSet: Bool = false
    var body: some View {
        ZStack {
            //            Color.yellow
            //                .ignoresSafeArea()
            GeometryReader { proxy in
                //Blur Effect Here
                BlurView(style: .systemUltraThinMaterial)
                
                ZStack {
//                    SegmentedButtonView()
                    
                    // MARK: Actual PickerButton
                    SegmentedPickerView()
                        .padding(.top)
                   
//                    CapsuleView()
//                    Spacer()
                }
            }
            .offset(y: offSet)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let startLocation = value.startLocation
                        offSet = startLocation.y + value.translation.height
                    }
            )
            .onAppear {
                if !isInitialOffsetSet {
                    offSet = UIScreen.main.bounds.height - 465
                    isInitialOffsetSet = true
                }
            }
        }
    }
}

struct BottomDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        BottomDrawerView()
    }
}

// BottomDrawerCapsuleView

struct CapsuleView: View {
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 70, height: 7)
                .foregroundColor(.white)
                .padding(9)
        }
    }
}
