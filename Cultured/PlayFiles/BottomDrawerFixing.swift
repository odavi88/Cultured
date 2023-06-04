//
//  BottomDrawerFixing.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/2/23.
//

import SwiftUI
import MapKit

struct BottomDrawerFixing: View {
    @State private var offSet: CGFloat = 0
    @State private var isInitialOffsetSet = false

    @GestureState private var dragOffset: CGSize = .zero

    var body: some View {
        ZStack {
            MapView() // Add the map view as the background
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            GeometryReader { proxy in
                // MARK: Blur Effect Here
                BlurView(style: .systemUltraThinMaterial)
                ScrollView {
                    VStack {
                        // MARK: Task List Here
                        ForEach(1...10, id: \.self) { index in
                            Text("Task \(index)")
                                .padding()
                        }
                    }
                }
                .padding(.top, 50) // Adjust the padding as needed
            }
            .offset(y: offSet + dragOffset.height)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        state = value.translation
                    }
                    .onEnded { value in
                        let newOffset = offSet + value.translation.height
                        offSet = min(max(newOffset, 0), UIScreen.main.bounds.height - 250)
                    }
            )
            .animation(.spring())
            .onAppear {
                if !isInitialOffsetSet {
                    offSet = UIScreen.main.bounds.height - 250
                    isInitialOffsetSet = true
                    print("View Appeared")
                }
            }
        }
    }
}

struct BottomDrawerFixing_Previews: PreviewProvider {
    static var previews: some View {
        BottomDrawerFixing()
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the map view if needed
    }
}
