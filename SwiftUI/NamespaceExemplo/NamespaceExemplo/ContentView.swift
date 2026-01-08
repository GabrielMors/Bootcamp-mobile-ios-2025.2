//
//  ContentView.swift
//  NamespaceExemplo
//
//  Created by Vagner Reis on 08/01/26.
//

import SwiftUI

struct ContentView: View {
    
    let languages = [
        "Swift",
        "Java",
        "Objective-C",
        "PHP",
        "Javascript"
    ]
    
    @State var selected = "Swift"
    
    @Namespace var animation
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(languages, id: \.self) { language in
                        ZStack(alignment: .bottom) {
                            Text(language)
                                .padding(.bottom, 4)
                                .onTapGesture {
                                    withAnimation {
                                        selected = language
                                    }
                                }
                            if selected == language {
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "underline", in: animation)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
