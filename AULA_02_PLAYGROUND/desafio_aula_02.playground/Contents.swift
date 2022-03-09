import UIKit

//Apply concepts from data structs, in this case we are seeing STACK

var books: [[String: String]] = []

//Get status from stack
func status() {
    let booksInStack = books.count
    
    if booksInStack > 0 {
        print("\(booksInStack) books in the stack")
    } else {
        print("There is no book in it.")
    }
}

//Remove last element
func dropBook() {
    let booksInStack = books.count
    
    if booksInStack > 0 {
        let bookDropped = books.removeLast()
        print("Book dropped \(bookDropped.keys)")
    } else {
        print("There is no book to sell.")
    }
}

//Add at last position
func putBook(title: String, author: String) {
    books.append([title: author])
    print("Book `\(title)` added on top of the stack!")
}

putBook(title: "Scherlock Holmes", author: "Arthur Conan Doyle")
putBook(title: "Macbeth", author: "William Schakpeare")
putBook(title: "Excalibur: A Novel of Arthur", author: "Bernard Conwell")

status()
dropBook()
status()

putBook(title: "Excalibur: A Novel of Arthur", author: "Bernard Conwell")




