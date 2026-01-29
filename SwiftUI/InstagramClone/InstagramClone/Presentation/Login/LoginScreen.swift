//
//  LoginScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 28/01/26.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject private var appViewModel: AppViewModel
    
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
            
            Button {
                
            } label: {
                Text("Esqueceu sua senha?")
            }
            .padding(.top, 8)
            
            Button {
                appViewModel.login(withEmail: email, andPaswword: password)
            } label: {
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 50)
                        .overlay {
                            Text("Entrar")
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
        .onChange(of: $email, $password) {
            self.appViewModel.clearError()
        }
    }
}

#Preview {
    LoginScreen()
        .environmentObject(AppViewModel())
}

fileprivate struct OnChangeModifier: ViewModifier {
    
    @Binding private var values: [String]
    private let closure: () -> Void
    
    init(values: Binding<[String]>, closure: @escaping () -> Void) {
        self._values = values
        self.closure = closure
    }
    
    func body(content: Content) -> some View {
        
        if #available(iOS 17.0, *) {
            content
                .onChange(of: values) { _, _ in
                    closure()
                }
        } else {
            content
                .onChange(of: values) { _ in
                    closure()
                }
        }
        
    }
    
}

fileprivate extension View {
    func onChange(
        of values: Binding<String>...,
        closure: @escaping () -> Void
    ) -> some View {
        
        let binding = Binding<[String]>(
            get: {
                values.map { $0.wrappedValue }
            },
            set: { newValues in
                for (index, value) in newValues.enumerated() {
                    if index < values.count {
                        values[index].wrappedValue = value
                    }
                }
            }
        )
        
        return modifier(OnChangeModifier(values: binding, closure: closure))
    }
}
