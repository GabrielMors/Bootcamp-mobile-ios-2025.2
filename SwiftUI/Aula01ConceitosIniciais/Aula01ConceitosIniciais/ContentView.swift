//
//  ContentView.swift
//  Aula01ConceitosIniciais
//
//  Created by Vagner Reis on 04/12/25.
//

import SwiftUI

// HStack -> Horizontal
// Vstack -> Vertical
// ZStack -> Sopreposto

struct ContentView: View {
    
    // MARK: Properties
    
    var body: some View {
        GeometryReader { geometry in
            
            let circleWidth = geometry.size.height / 7
            
            VStack {
                // MARK: HStack
                HStack(spacing: 16) {
                    Text("Texto 01")
                        .font(.headline)
                    
                    Text("Texto 02")
                    
                    
                    Text("Texto 03")
                    
                } // END: HStack
                .font(.title)
                .padding(.vertical)
                .background(.blue.opacity(0.1))
                
                // MARK: VStack
                VStack {
                    Text("Texto 01")
                        .font(.headline)
                    
                    Text("Texto 02")
                    
                    
                    Text("Texto 03")
                } // END: VStack
                .font(.title)
                .padding(.vertical)
                .background(.blue.opacity(0.1))
                
                // MARK: ZStack
                ZStack {
                    
                    Circle()
                        .frame(width: circleWidth)
                        .foregroundStyle(.purple)
                    
                    Text("10")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                    
                } // END: ZStack
                
                // MARK: Overlay
                
                Circle()
                    .frame(width: circleWidth)
                    .foregroundStyle(.purple)
                    .overlay(
                        Text("10")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .fontDesign(.rounded)
                    )
                
                HStack(spacing: 32) {
                    Text("Texto 01")
                    Spacer()
                    Text("Texto 02")
                    Spacer()
                    Text("Texto 03")
                }
                .background(.blue.opacity(0.2))
                .padding(.top, 32)
                
                
            }
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.height - geometry.safeAreaInsets.bottom)
            .background(.red.opacity(0.1))
            
        }

    }
}

#if DEBUG
// Forma nova
#Preview {
    ContentView()
}
#endif


// Forma antiga
//struct ContentView_Previews: PreviewProvider {
//   static var previews: some View {
//       ContentView()
//   }
//}


