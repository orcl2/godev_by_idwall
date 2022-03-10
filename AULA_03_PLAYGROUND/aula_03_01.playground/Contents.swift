import UIKit

/*
 Switch
 */
var notaMedia = 6

switch notaMedia {
case 0:
    print("Voce precisa estudar")
case 1...5:
    print("Voce esta abaixo da media")
case 6:
    print("Voce esta na media")
case 7...9:
    print("Voce esta acima da media")
case 10:
    print("Parabens, voce atingiu a nota maxima")
default:
    print("")
}

/*
 Enum
 */

enum Aluno {
    case Joao
    case Pedro
    case Maria
}

let aluno = Aluno.Joao
print(aluno)

switch aluno {
case .Joao:
    print("Nota 6")
case .Pedro:
    print("Nota 8")
case .Maria:
    print("Nota 10")
}

enum State {
    case Success
    case Error
    case Loading
}

let state = State.Loading

switch state {
case .Success:
    print("Sucesso")
case .Error:
    print("Erro")
case .Loading:
    print("Carregando")
}

/* --------------------------------------- */

enum RequestState: String {
    case success = "Efetuado com sucesso"
    case failure = "Falha, tente novamente"
}

let requestState = RequestState.success
print(requestState.rawValue)

/* --------------------------------------- */

let button = UIButton()
button.setTitle("Nome do botão", for: .normal)

let label = UILabel()
label.text = "O texto referente"

enum Strings: String {
    case titleButton = "Comprar"
    case titleLabel = "Texto customizado"
}

button.setTitle(Strings.titleButton.rawValue, for: .normal)
label.text = Strings.titleLabel.rawValue

/* --------------------------------------- */

enum Page: Int {
    case one = 1, two, three, four
    
    func getPage() -> Int {
        return self.rawValue
    }
}

var numberPage = Page.four
print(numberPage.getPage())

/* --------------------------------------- */

enum BankDeposit {
    case inValue(Int)
    case inCheck(Bool)
}

func makeDeposit(values: BankDeposit) {
    switch values {
    case .inValue(let value):
        print("O valor passado é: \(value)")
    case .inCheck(let isCheck):
        print("In check: \(isCheck)")
    }
}

let deposit = BankDeposit.inValue(400)
makeDeposit(values: deposit)
