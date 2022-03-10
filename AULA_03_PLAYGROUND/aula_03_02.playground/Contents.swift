import UIKit

/*
 Conceitos de programacao funcional
 */

var estudantes = ["William", "Arthur", "Érica", "Bianca", "Pablo"]

//array completo
print(estudantes)

//ultimo elemento
print(estudantes.last)

//primeiro elemento
print(estudantes.first)

//ordenacao
print(estudantes.sorted())

// lhs = left hand side = lado direito
// rhs = right hand side = lso esquerdo
estudantes.sorted{ (lhs: String, rhs: String) -> Bool in
    lhs > rhs
}
print(estudantes)

let descending = estudantes.sorted(by: <)
print(descending)

let array1 = [1, 2, 3, 4, 5]
let array2 = [10, 23, 45, 56, 91]

let array3 = array1 + array2
print(array3)

/*
 MAP
 */

var alunosNota = [4, 5, 7, 9, 3]

//var novasNotas: [Int] = []
//
//for nota in alunosNota {
//    let novaNota = nota + 1
//    novasNotas.append(novaNota)
//}
//
//print(alunosNota)
//print(novasNotas)

alunosNota = alunosNota.map({ res in
    return res + 1
})

// OU

alunosNota = alunosNota.map { $0 + 1 }

print(alunosNota)

/*
 Filter
 */

//var aprovadosNotas: [Int] = []
//
//for nota in alunosNota {
//    if nota >= 6 {
//        aprovadosNotas.append(nota)
//    }
//}
//
//print(aprovadosNotas)

alunosNota = alunosNota.filter { res in
    res >= 6
}

//OU

alunosNota = alunosNota.filter{ $0 >= 6 }

print(alunosNota)

/*
 Reduce
 */

//var somatorioDeNotas: Int = 0
//
//for nota in alunosNota {
//    somatorioDeNotas += nota
//}
//
//print(somatorioDeNotas)

var soma = alunosNota.reduce(0) { lhs, rhs in
    lhs + rhs
}

//OU

soma = alunosNota.reduce(0, { $0 + $1 })

//OU

soma = alunosNota.reduce(0, +)

print(soma)
