import UIKit

/*
 CLASS
 Reference Type
 */
class Person {

    var name: String
    var lastName: String
    var age: Int

    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }

    func welcome() {
        print("Seja bem-vindo, \(name) \(lastName)")
    }
}

var person1 = Person(name: "William Daniel", lastName: "da Silva Kuhs", age: 29)
var person2 = person1

person1.name = "Roger"

print(person1.welcome())
print(person2.welcome())

/*
 STRUCT
 Value Type
 */
struct PersonStruct {
    var name: String
    var lastName: String
    var age: Int

    func welcome() {
        print("Seja bem-vindo, \(name) \(lastName)")
    }
}

var person3 = PersonStruct(name: "William Daniel", lastName: "da Silva Kuhs", age: 29)
var person4 = person3

person3.name = "Rodrigo"

print(person3.welcome())
print(person4.welcome())
