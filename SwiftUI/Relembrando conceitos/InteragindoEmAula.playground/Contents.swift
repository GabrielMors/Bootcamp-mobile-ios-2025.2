import UIKit
import SwiftUI
import Foundation

// 1. Diferença entre MVVM no UIKit e no SwiftUI, pq no SwiftUI e mais facil?

// No UIKit, o MVMV precisa ser gerenciado manualmente usando delegates, closure ou usando frameworks externos por ex (RXSwift)
// No SwiftUI, o MVVM funciona melhor pq a interface ja é reativa e baseada em estados

// UIKit, mais manual
// O ViewController precisa observar as mudancas na ViewModel

class ViewModelUIKit {
    
    // Isso esta sendo "Observado"
    var name: String = "" {
        didSet {
            print("A variavel teve seu valor alterado")
            onNameChange(name)
        }
    }
    
    // Aqui estou declarando a closure igual eu faria com uma variavel
    private let onNameChange: ((String) -> Void)
    
    init(onNameChange: @escaping (String) -> Void) {
        self.onNameChange = onNameChange
    }
}


class ViewControllerUIKit {
    
    private(set) var viewModel: ViewModelUIKit!
    
    // Isso seria uma UILabel, mudaria para o usuario
    // Quando ocorrer mudancas no alvo "que no caso seria ViewModelUIKit.name" aqui recebe o valor
    var nameLabel: String = "Antigo"
    
    // Como nao temos ciclo de vida, fazemos assim
    // isso ficaria na onAppear
    init() {
        viewModel = ViewModelUIKit { name in
            // issso equivale a label.text = name
            print("A variavel ViewModelUIKit.name mudou para: \(name)")
            self.nameLabel = name
        }
    }
    
}

let controller = ViewControllerUIKit()
controller.viewModel.name = "Novo nome para teste"
print(controller.nameLabel)

// 2. O que acontece se você criar um @StateObject dentro de uma View que recria várias vezes?

// O @StateObject e criado apenas uma vez durante o ciclo de vida da view
// Mesmo que o body execute varias vezes
// Nao usar @ObservedObject para instancias opjetos somente para injecao de dependencia

import Combine

class ViewModelSwiftUI: ObservableObject {
    @Published private(set) var name = "Vagner"
    
    func changeName(_ newName: String) {
        name = newName
    }
}

struct ViewSwifUI: View {
    
    @StateObject var viewModel = ViewModelSwiftUI()
    
    // Diffing
    var body: some View {
        Text(viewModel.name)
        // Injecao de dependencia
        ViewSwifUIFilha(viewModel: viewModel)
        ViewSwifUIFilha2(viewModel: viewModel)
    }
}

struct ViewSwifUIFilha: View {
    
    // Compartilhada
    @ObservedObject var viewModel: ViewModelSwiftUI
    
    // Diffing
    var body: some View {
        VStack {
            Button {
                viewModel.changeName("Pedro")
            } label: {
                 Text("Mudar Nome filha")
            }

        }
    }
}

struct ViewSwifUIFilha2: View {
    
    @ObservedObject var viewModel: ViewModelSwiftUI
    
    // Diffing
    var body: some View {
        VStack {
            Button {
                viewModel.changeName("Carla")
            } label: {
                 Text("Mudar Nome filha 2")
            }

        }
    }
}


// 3. Quando usar EnvironmentObject?
// Usado para dados globalmente entre varias view
// 1. Usuario ex. UserSession
// 2. Tema do app
// 3. Configuracoes globais
// 4. Carrinho de compra

// Com EnvironmentObject
class ViewModelSwiftUIWithEnvironmentObject: ObservableObject {
    @Published private(set) var name = "Vagner"
    
    func changeName(_ newName: String) {
        name = newName
    }
}

struct ViewSwifUIWithEnvironmentObject: View {
    
    @StateObject var viewModel = ViewModelSwiftUIWithEnvironmentObject()
    
    // Diffing
    var body: some View {
        VStack {
            Text(viewModel.name)
            // Injecao de dependencia
            ViewSwifUIFilhaWithEnvironmentObject()
            ViewSwifUIFilha2WithEnvironmentObject()
        }
        .environmentObject(viewModel)
    }
}

struct ViewSwifUIFilhaWithEnvironmentObject: View {
    
    // Compartilhada
    @EnvironmentObject var viewModel: ViewModelSwiftUIWithEnvironmentObject
    
    // Diffing
    var body: some View {
        VStack {
            Button {
                viewModel.changeName("Pedro")
            } label: {
                 Text("Mudar Nome filha")
            }

        }
    }
}

struct ViewSwifUIFilha2WithEnvironmentObject: View {
    
    @EnvironmentObject var viewModel: ViewModelSwiftUIWithEnvironmentObject
    
    // Diffing
    var body: some View {
        VStack {
            Button {
                viewModel.changeName("Carla")
            } label: {
                 Text("Mudar Nome filha 2")
            }

        }
    }
}

// 4. Por que SwiftUI é mais fácil para Dark Mode?

// A interface reage ao ambiente do sistema

struct ViewSwiftUITema: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Ola Mundo")
            .foregroundStyle(colorScheme == .dark ? .red : .blue)
    }
}

// 5. O que significa View ser uma struct?

// Structs sao imutaveis e leves, que podem e vao ser recriadas (Diffing) varias vezes
// nao tem problema de retain cycle ela e value type e nao reference type
// SwiftUI usa Diffing para comparar as mudancas
// Apenas a UI alterada sera modificada
