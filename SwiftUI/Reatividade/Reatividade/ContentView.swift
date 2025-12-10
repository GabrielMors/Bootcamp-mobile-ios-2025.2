//
//  ContentView.swift
//  Reatividade
//
//  Created by Vagner Reis on 10/12/25.
//

import SwiftUI

struct ContentView: View {
    
    // Property wrapper
    @State var contador: Int = 0
    
    var body: some View {
        VStack {
            ChildView(contador: $contador)
            
            Text("Contador: \(contador)")
                .font(.title)
            
            Button {
                 contador += 1
            } label: {
                Text("Incrementar")
            }
            
            Button {
                 contador -= 1
            } label: {
                Text("Decrementar")
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct ChildView: View {
    
    @Binding private var contador: Int
    
    init(contador: Binding<Int>) {
        self._contador = contador
    }
    
    var body: some View {
        
        Text("Contador: \(contador)")
            .font(.title)
        
        Button {
             contador += 1
        } label: {
            Text("Incrementar")
        }
        
        Button {
             contador -= 1
        } label: {
            Text("Decrementar")
        }
        
        

    }
}
