//
//  BottomDrawerView.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI

// DrawerView Code Here
struct BottomDrawerView: View {
    @State private var offSet: CGFloat = 0
    @State private var isInitialOffsetSet: Bool = false
    @GestureState private var dragOffset: CGSize = .zero
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                
                // MARK: Blur Effect Here
                BlurView(style: .systemUltraThinMaterial)
//                HStack {
                VStack {
                    CapsuleView()
                    // MARK: Actual PickerButton
                    SegmentedPickerView()
                        .environmentObject(DistrictsViewModel())
//                        .padding(.top)
                }
                   
//                }
                
            }
            .offset(y: offSet)
            .gesture(
                DragGesture()
                    .onChanged { value in
//                        let startLocation = value.startLocation
//                    offSet = value.translation.height
                        let newOffset = offSet + value.translation.height
                                             offSet = min(max(newOffset, 0), UIScreen.main.bounds.height - 250)
                    }
            )
            .animation(.spring())
            .onAppear {
                if !isInitialOffsetSet {
                    offSet = UIScreen.main.bounds.height - 250
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
                .frame(width: 71, height: 8)
                .foregroundColor(.white)
                .padding(9)
        }
    }
}
