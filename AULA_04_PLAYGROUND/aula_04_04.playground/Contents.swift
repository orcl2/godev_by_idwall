import UIKit

var greeting = "Hello, playground"

protocol SomeProtocol {
    //prototypes
}

protocol ReformarCampo {
    
    func plantarNovaGrama()
    func pintarNovasLinhas()
    
}

class EmpresaA: ReformarCampo {
    func plantarNovaGrama() {
        print("Plantar manualmente a grama!")
    }
    
    func pintarNovasLinhas() {
        print("Pintar manualmente novas linhas!")
    }
}

class EmpresaB: ReformarCampo {
    func plantarNovaGrama() {
        print("Plantar gramas com carrinho de plantio!")
    }
    
    func pintarNovasLinhas() {
        print("Pintar linhas com carrinho de pintura!")
    }
}

func efetuarReformaDoCampo(reformador: ReformarCampo) {
    reformador.plantarNovaGrama()
    reformador.pintarNovasLinhas()
}

let empresaA = EmpresaA()
let empresaB = EmpresaB()

efetuarReformaDoCampo(reformador: empresaA)
efetuarReformaDoCampo(reformador: empresaB)
