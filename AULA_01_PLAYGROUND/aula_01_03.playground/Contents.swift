import UIKit

let isHidden = true
let isEnable = false

if isHidden {
    print("Caso Verdadeiro: isHidden")
} else if isEnable {
    print("Caso Verdadeiro: isEnable")
} else {
    print("Caso Falso")
}

var system: String
let company: String = "Apple"

if company == "Apple" {
    system = "iOS"
} else {
    system = "Android"
}

print(system)

system = company == "Apple" ? "iOS" : "Android"

print(system)
