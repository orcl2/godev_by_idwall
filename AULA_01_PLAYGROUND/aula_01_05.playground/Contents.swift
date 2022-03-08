import UIKit

var dic: [[String: Any]] = [
    ["name": "William Daniel", "email": "wdarchenemy@email.com", "age": 28, "isValid": true],
    ["name": "William Daniel", "email": "wdarchenemy@email.com", "age": 28, "isValid": true],
    ["name": "William Daniel", "email": "wdarchenemy@email.com", "age": 28, "isValid": true],
]
print(dic[0]["name"] ?? "Não encontrado!")
