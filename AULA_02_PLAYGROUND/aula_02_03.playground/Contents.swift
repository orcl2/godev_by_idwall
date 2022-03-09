import UIKit

func myCar() {
    print("Meu carro")
}

func myCar(name: String) {
    print("Meu carro é: \(name)")
}

myCar()
myCar(name: "Gol")

func myName(name first: String) {
    print("Meu nome é: \(first)")
}

myName(name: "William")

func myAge(_ age: Int) {
    print("Tenho \(age) anos de idade.")
}

myAge(28)

/*
 Função com retorno
 */
typealias FullName = String
func getFullName(first: String, last: String) -> FullName {
    "\(first) \(last)"
}

let fullName = getFullName(first: "William", last: "Kuhs")
print(fullName)

typealias Person =  (String, String)
func getPerson(name: String, lastName: String) -> Person {
    (name, lastName)
}

let person = getPerson(name: "William", lastName: "Kuhs")
print(person.0)
print(person.1)

/*
 Closure
 */

func makeBuy(value: Int, onCompletion: (Int) -> Void) {
    print("Processing...")
    onCompletion(value)
}

makeBuy(value: 20) { quantity in
    print("Items bought: \(quantity)")
    print("Completed!")
}

typealias onCompletionSucess = (String) -> Void
typealias onCompletionError = (String) -> Void

func makeBuyProduct(isValid: Bool,
                    onCompletion: onCompletionSucess,
                    onCompletionError: onCompletionError) {

    if isValid {
        onCompletion("Success")
    } else {
        onCompletionError("Error")
    }
}

makeBuyProduct(isValid: false) { success in
    print("Sucesso, respota: \(success)")
} onCompletionError: { error in
    print("Erro, resposta: \(error)")
}















