//
//  ContentView.swift
//  Operations
//
//  Created by Vagner Reis on 09/03/26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            
            Text("Notes")
                .font(.largeTitle)
                .bold()
            
            if viewModel.isLoading {
                ProgressView {
                    Text("Carregando...")
                }  
            } else {
                ForEach(viewModel.notes) { note in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.description)
                                .font(.subheadline)
                        }
                        .padding(.bottom, 4)
                        
                        Spacer()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
