import UIKit

/*
 Coleção de dados - Array
 */

var carros = ["Fusca", "Ferrari", "Audi A3", "Celta", "Marea Turbo"]
print(carros)

carros.append("Saveiro")
carros.insert("BMW M3", at: 3)
print(carros)

print(carros.removeLast())
print(carros.removeFirst())

carros.removeAll()
print(carros)

//OFF TOPIC TUPLA
var tupla: (String, Int, Bool) = ("William", 28, false)
print(tupla)
