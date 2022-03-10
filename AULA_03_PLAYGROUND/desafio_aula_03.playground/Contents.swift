//William Daniel
//09/03/2022

import UIKit

//Realizar uma funcao que retorna true ou false para palavras palindromas

//OBS:Criei alguns metodos que trazem o mesmo resultado, porém com metodologias distintas.
//Até o momento elaborei 2 funções diferentes


//Basicamente é um comparativo direto entre duas palavras,
//onde uma é o inverso da outra
func isPalindrome1(_ word: String) -> Bool {
    let reversedWord = String(word.reversed())
    
    return word.lowercased() == reversedWord.lowercased()
}

//Utilizando o reduce, fazendo operações AND sucessivas com o resultado inicial e resultados parciais,
//verifico no decorrer das iteracoes se o caracter atual é igual ao ultimo caracter,
//e ao mesmo tempo vou eliminando o ultimo caracter da variável auxiliar
func isPalindrome2(_ word: String) -> Bool {
    var originalWord = word.lowercased()
    
    return word.lowercased().reduce(true) { partialResult, character in
        partialResult && character == originalWord.removeLast()
    }
}

//Para teste basta adicionar as palavras no array,
//lembrando que as funcoes desconsideram letras capitalizadas
let words = [
    "Hannah",
    "Churrasco",
    "Roma amor",
    "Alfabeto"
]

//For usado para apresentar os resultados
for word in words {
    print("Processing word \(word)")
    
    var result = isPalindrome1(word)
    print("Result of isPalindrome1 = \(result)")
    
    result = isPalindrome2(word)
    print("Result of isPalindrome2 = \(result)\n")
}
