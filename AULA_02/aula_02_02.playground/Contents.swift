import UIKit

func icon() -> UIImage {
    
    guard let image = UIImage(named: "Photo") else {
        return UIImage(named: "Default")!
    }
    
    return image
}

func printSomething(parameter: String?) {
    
    guard let parameter = parameter else {
        print("There is nothing to print!")
        return
    }

    print(parameter)
}

var word: String?

word = "Alphabet"
printSomething(parameter: word)

word = nil
printSomething(parameter: word)
