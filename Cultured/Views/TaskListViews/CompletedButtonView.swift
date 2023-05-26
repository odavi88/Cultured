//
//  SuggustedButtonView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/7/23.
//

import SwiftUI

struct CompletedButtonView: View {
    @EnvironmentObject var vm: DistrictsViewModel
    var body: some View {
        VStack(spacing: 30) {
            
            NavigationLink {
                CompletedView()
            } label: {
                Text("Completed!")
            }
            
            Button(action: {
                
            }, label: {
                Text("Completed")
                    .font(.system(size: 15))
                    .minimumScaleFactor(0.5)
                    .font(.headline)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 15)
                    .foregroundColor(.white)
                    .background(
                        Color.red
                    )
                    .cornerRadius(15)
            })
        }
    }
}

struct CompletedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedButtonView()
    }
}
