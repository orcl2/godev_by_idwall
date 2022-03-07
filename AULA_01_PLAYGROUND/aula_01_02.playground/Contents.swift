import UIKit

// Incrementos, operadores lógicos

let num1 = 10
let num2 = 20

let name = "William Daniel"
let lastName = "da Silva Kuhs"

let compair = num1 < num2
print(compair)

let res = name < lastName
print(res)

/*
 = Atribuição
 == Comparação
 != Diferente de
 < Menor
 <= Menor igual a
 > Maior
 >= Maior igual a
 */

// Expressões

// ! Operador de inversão

let isHidden: Bool = true
let isEnable: Bool = true
print(!isHidden)

/*
 || ou
 && e
 */

let res2 = isHidden || isEnable
print(res2)

let res3 = isHidden && isEnable
print(res3)

/*
 Incremento
 
 += Incrementa
 -= Decrementa
 */

var numIncrement = 10
var numDecrement = 10

numIncrement += 1
numDecrement -= 1
