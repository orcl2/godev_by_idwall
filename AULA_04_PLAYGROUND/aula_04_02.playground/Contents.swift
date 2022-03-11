import UIKit

protocol Nota {
    func getNota()
}

protocol Materia {
    func getMateria()
}

class Aluno {
    var name: String?
    
    func getName() -> String {
        guard let name = name else { return "" }
        
        return name
    }
}

extension Aluno {
    
    func setAluno(name: String) {
        self.name = name
    }
}
