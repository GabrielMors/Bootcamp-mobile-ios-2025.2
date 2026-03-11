//
//  ContentView.swift
//  Threads
//
//  Created by Vagner Reis on 05/03/26.
//

import SwiftUI



// Thread safe
class Inventory {
    
    private var items: [String] = []
    
    private var queue = DispatchQueue(
        label: "com.vagnerreis.inventory"
    )
    
    func append(_ item: String) {
        queue.async {
            self.items.append(item)
        }
    }
    
    func getCount() -> Int {
        queue.sync {
            return items.count
        }
    }
    
    func removeItem() {
        queue.async {
            self.items.removeLast()
        }
    }
    
}

struct ContentView: View {
    
    @State var text: String = ""
    
    var inventory = Inventory()
    
    private var queue = DispatchQueue(
        label: "com.vagnerreis.threads_TEST"
    )
    
    var body: some View {
        VStack {
            Button {
                 print("CLICK No BOTAO")
            } label: {
                Text("Click-me")
            }

            Text(text)
        }
        .padding()
        .onAppear {
            
            // 1 BG
//            queue.async {
//                // Busca backend
//                print("GLOBAL: ",Thread.current)
//                Thread.sleep(forTimeInterval: 6)
//                // Nesse ponto eu faco o trabalho pesado
//                // ex, buscar dados no backend, algum tratamento de imagem
//                // servico pesado
//              
//                
//                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//                    print("MAIN: ", Thread.current)
//                    text = "Pedro"
//                }
//                
//            }
//            
//            queue.async {
//                print("Executou esse bloco")
//            }
//            
//            // 3 MAIN
//            DispatchQueue.main.async {
//                print("Carregando...")
//                text = "Carregando..."
//            }
            
           
            for i in 1...10000 {
                DispatchQueue.global().async {
                    inventory.append("Item \(i)")
                }
            }
            
//            inventory.append("Item 2")
//            
            let totalItems = inventory.getCount()
            print(totalItems)
            inventory.removeItem()
            
        }
    }
}

#Preview {
    ContentView()
}
