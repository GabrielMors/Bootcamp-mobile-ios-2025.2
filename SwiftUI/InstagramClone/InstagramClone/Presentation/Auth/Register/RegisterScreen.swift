//
//  RegisterScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 28/01/26.
//

import SwiftUI

struct RegisterScreen: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    
    @EnvironmentObject private var appViewModel: AppViewModel
    
    @EnvironmentObject private var authNavigationViewModel: AuthNavigationViewModel
    
    var applicationError: String?
    
    init(applicationError: String? = nil) {
        self.applicationError = applicationError
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            CustomTextFieldView(
                placeholder: "Digite seu e-mail",
                text: $email
            )
            
            CustomTextFieldView(
                placeholder: "Digite sua senha",
                text: $password,
                textContentType: .security
            )
            
            CustomTextFieldView(
                placeholder: "Repetir senha",
                text: $repeatPassword,
                textContentType: .security
            )
            
            Button {
                authNavigationViewModel.back()
            } label: {
                Text("Ja tem conta? Entre!")
            }
            .padding(.top, 8)
            
            
            Button {
                appViewModel.register(
                    withEmail: email,
                    password: password,
                    repeatPassword: repeatPassword
                )
            } label: {
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 50)
                        .overlay {
                            Text("Registrar")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    
                    if appViewModel.isLoading {
                        ProgressView()
                            .tint(.white)
                            .padding(.trailing)
                    }
                }
            }
            .padding(.top, 8)
            
            VStack {
                if let loginErrorMessage = appViewModel.loginErrorMessage {
                    Text(loginErrorMessage)
                        .foregroundStyle(.red)
                        .padding(.top)
                        .fontWeight(.semibold)
                        .lineLimit(nil)
                        .multilineTextAlignment(.trailing)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                if let applicationError {
                    Text(applicationError)
                        .foregroundStyle(.red)
                        .padding(.top)
                        .fontWeight(.semibold)
                }
            }
            .frame(height: 40)
            
        }
        .padding(.horizontal)
        .onChangeAuth(of: $email, $password, $repeatPassword) {
            self.appViewModel.clearError()
        }
    }
}

#Preview {
    RegisterScreen()
        .environmentObject(AppViewModel())
}
