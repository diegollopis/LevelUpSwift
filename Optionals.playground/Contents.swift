import UIKit

//
// Optionals
//
// Type that may or may not have a value

// Concrete type Int
let number1: Int = Int(42)
let number2: Int = 42
let number3 = 42

// Optional
//let possibleNumber: Int?

// Example
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// converted is inferred to be of type "Int?", or "optional Int"

// Optional Binding
let possibleANumber: Int? = 42

if let number = possibleANumber {
    print("We have a number \(number)!")
} else {
    print("Sorry. No soup for you!")
}

func printNumber(possibleNumber: Int?) {
    guard let number = possibleNumber else {
        print("No number here.")
        return
    }
    print("We have a number \(number)!")
}

printNumber(possibleNumber: 123)

// Nil- Coalescing
let nickName: String? = nil
let defaultName: String = "John"
let informalGreeting = "Hi \(nickName ?? defaultName)"

// Optional Chaining
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
// let roomCount = john.residence!.numberOfRooms // runtime error Boom
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Working with real values is always easier...
// So only use Optionals when you really need them.

/*
    ___       _   _               _     _                  _
   / _ \ _ __| |_(_)___ _ _  __ _| |   /_\  _ _ __ __ _ __| |___
  | (_) | '_ \  _| / _ \ ' \/ _` | |  / _ \| '_/ _/ _` / _` / -_)
   \___/| .__/\__|_\___/_||_\__,_|_| /_/ \_\_| \__\__,_\__,_\___|
        |_|
 */

/*
🕹 Unwrap with if-let
Unwrap the following Optional using the if let statement
*/

let firstname: String? = "Sam"

if let name = firstname {
    print("Hey, your name is \(name), right?")
} else {
    print("Unable to find a name!")
}
/*
🕹 Unwrap with guard
Unwrap the following Optional using the guard statement
*/

enum MyError: Error {
    case invalidUsername
}

let lastname: String? = "Flynn"

func checkName(lastName: String?) {
    guard let name = lastName else {
        print(MyError.invalidUsername)
        return
    }
    print("Welcome, \(name)")
}

checkName(lastName: lastname)

