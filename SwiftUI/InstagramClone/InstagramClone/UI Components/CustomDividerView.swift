//
//  CustomDividerView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.gray.opacity(0.3))
    }
}

#Preview {
    CustomDividerView()
}
