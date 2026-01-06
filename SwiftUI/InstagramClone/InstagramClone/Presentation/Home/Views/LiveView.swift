//
//  LiveView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct LiveView: View {
    var body: some View {
        ZStack {
            ZStack {
                
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 28, height: 18)
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 26, height: 16)
                    .foregroundStyle(LinearGradient.liveLinearGradient)
            }
            
            Text("LIVE")
                .font(.system(size: 9))
                .foregroundStyle(.white)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    LiveView()
        .padding()
        .background(.blue)
}
