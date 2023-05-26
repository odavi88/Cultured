//
//  DistrictPickerView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/8/23.
//

import SwiftUI

struct CategoryPickerView: View {
    @State private var blah: Districts = .downtown
    var body: some View {
        Picker("Hello", selection: $blah) {
            ForEach(Districts.allCases, id: \.self) { district in
                Text(district.districtName)
            }
        }.pickerStyle(.segmented)
    }
}

struct CategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPickerView()
    }
}
