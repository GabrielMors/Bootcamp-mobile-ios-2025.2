//
//  ContentView.swift
//  MyNotifications
//
//  Created by Vagner Reis on 18/02/26.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            
            Button {
                let local = LocalNotification()
                local.scheduling()
            } label: {
                 Text("Agendar notificacao futura")
            }
            
            Button {
                MessageNotificationsSend.shared.send()
            } label: {
                 Text("Send Notification")
            }
            
            Button {
                MessageNotificationsSend.shared.sendInLive()
            } label: {
                 Text("Testar inLive")
            }
            
            if viewModel.inLive {
                Text("Estamos ao VIVO")
            }
            
            ForEach(viewModel.messages, id: \.name) { message in
                VStack {
                    Label(message.name, systemImage: message.iconName)
                    Label(message.age, systemImage: message.iconAge)
                }
            }
            .onChange(of: viewModel.messages) { newValue in
                print(newValue)
            }
            
            if !viewModel.firebaseMSG.isEmpty {
                Text(viewModel.firebaseMSG)
            }
            
            Button {
                viewModel.observador.send("um valor qualquer")
                viewModel.observador.send(completion: .failure(NSError(domain: "com.test", code: 10)))
            } label: {
                Text("Enviar evento")
            }

        }
        .padding()
        .onReceive(NotificationCenter.default.publisher(for: .firebaseMSG)) { output in
            if let firebaseMSG = output.userInfo?["firebaseMSG"] as? String {
                viewModel.firebaseMSG = firebaseMSG
            }
        }
    }
}

#Preview {
    ContentView()
}
