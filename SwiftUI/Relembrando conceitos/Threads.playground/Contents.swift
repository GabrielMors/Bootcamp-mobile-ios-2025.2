import Foundation

//for i in 0...1_000_000 {
//    print(i)
//}

// UI trava
// app fica congelado

DispatchQueue.main.async {
    Thread.sleep(forTimeInterval: 3)
    print("Async")
}

DispatchQueue.main.async {
    print("Async 22")
}
