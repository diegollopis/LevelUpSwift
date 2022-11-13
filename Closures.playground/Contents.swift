import UIKit

//
// Closures
//

// A closure is just a body of code that can be passed around and used in your code.
let closureAsCode = {
    let player1 = "Player1"
    let computer = "Computer"
    
    print(player1.count > computer.count ? "\(player1) wins!" : "Game Over!")
}

// Which can be executed like this
closureAsCode()

// We can define them as variables...
let closureAsVariable = { print("I'm a closure!") }
closureAsVariable

// ...methods
func printer(payload: String) { // nothing more than a function
    print(payload)
}

// and even pass them as variables to other methods
func printIt(closure: (String) -> String) -> Void {
    let message = "Hello old friend!"
    closure(message) // And execute
}

printIt(closure: { _ in return "Imprimindo..." } )

// Closures have type

// a closure that has no parameters and return a String
var hello: () -> (String) = {
    return "Hello!"
}
hello()

// but you don't need to include
var hello2 = {
    return "Hello again!"
}
hello2()

// a closure that take one Int and return a Int
var double: (Int) -> (Int) = { x in
    return 2 * x
}
double(4) // 8

// you can pass closures in your code, for example, to other variables
var alsoDouble = double
alsoDouble(5) // 10

// Closures are first class citizens in Swift (variables, functions, return types)
// - asynchronous network calls
// - as a means of passing around processing
// - also make our code easier to read and reason about

// Example - Array has a method called sort that takes a function (as a closure) and uses it to compare elements.
/// func sorted(by areIncreadingOrder: (Element, Element) -> Bool) -> [Element]

// Instead of trying to come up with every permutation and combination of users would want to compare
// it defines a closure, as a type, and let's you write whatever comparison logic you want yourself.

/// func sorted((Element, Element) -> Bool) -> [Element]
/// func backward((String, String) -> Bool) -> [String]

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// We can define a function matching that signature...
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2 // define our logic (as a closure)
}

// and then pass that in and use it to sort the names in our array
let reversedNames = names.sorted(by: backward)

// Swift has a lot of shortcuts for how to write closures more tersely (matter of style and choice).

// Closure inlined
let reversedNames2 = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Inferring type from context
let reversedNames3 = names.sorted(by: {s1, s2 in return s1 > s2})

// Implicit return from single-expression
let reversedNames4 = names.sorted(by: {s1, s2 in s1 > s2})

// Shorthand $0 and $1
let reversedNames5 = names.sorted(by: {$0 > $1})

// Trailing Closures
let reversedNames6 = names.sorted() {$0 > $1}

// Operator method that match our function signature
let reversedNames7 = names.sorted(by: >)

// Ready Player 1 - Shortfirst
//
// Using the Array.sorted() method, write a closure that sorts the Array based on length of string
let cars = ["Audi", "Ferrari", "Bugatti", "Mercedes", "BMW", "Aston-Martin", "Porsche", "Mclaren"]
//
func shortFirst(_ s1: String, _ s2: String) -> Bool {
    s2.count > s1.count
}

let shortWords = cars.sorted(by: shortFirst)
print(shortWords)

let shortWords2 = cars.sorted(by: {s1, s2 in s2.count > s1.count})
print(shortWords2)

// - Ready Player 1 - Trailing Closures
//
// Inline this method using any of the methods described above
//
let shortWords3 = cars.sorted() { $1.count > $0.count }
print(shortWords3)

// Map, Filter, Reduce - aka Higher Order Functions
//
// A higher order function is a function that does at least one of the following:
// - takes a function as an input
// - return a function as the output

// Swift has three important higher order function implemented for arrays: map, filter and reduce
//
// Map - Transforms an array using a function
//
// One way
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var strings = [String]()
for number in numbers {
    strings.append("\(number)")
}

// But a better way
var strings1 = numbers.map {"\($0)"}
print(strings1)

//
// Filter - Selects the elements of an array which satisfy a certain condition
//

var evenNumbers = numbers.filter { num in
    num % 2 == 0
}
print(evenNumbers)

// Using trailing closures
var evenNumbers1 = numbers.filter { $0 % 2 == 0 }
print(evenNumbers1)

//
// Reduce - Combines all the values from an array into a single value
//
var numbers1 = [1, 2, 3, 4, 5]
var result = numbers1.reduce(0) { $0 + $1 }
print(result)

/*
     ___ _                         _                  _
    / __| |___ ____  _ _ _ ___    /_\  _ _ __ __ _ __| |___
   | (__| / _ (_-< || | '_/ -_)  / _ \| '_/ _/ _` / _` / -_)
    \___|_\___/__/\_,_|_| \___| /_/ \_\_| \__\__,_\__,_\___|
 
*/

/*
🕹 K times
Write a function named applyKTimes that takes an integer K and a closure and calls the closure K times. The closure will not take any parameters and will not have a return value.
> applyKTimes(K: 3, closure: { print("I heart Swift") })
*/

func applyKTimes(k: Int, text: () -> ()) {
    for _ in 1...k {
        text()
    }
}

applyKTimes(k: 3) {
    print("Printing...")
}

/*
🕹 Div3
Use filter to create an array called multiples that contains all the multiples of 3 from a given array.
let numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
> let multiples = numbers.filter { ? }                     // Hint: Modulus Operator
// [3, 6, 9, 3, 12]
*/
let numbers3 = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
let multiples = numbers3.filter { $0 % 3 == 0 }
print(multiples)

/*
🕹 Max
Find the largest number from numbers and then print it. Use reduce to solve this exercise.
*/
let largestNumber = numbers3.reduce(numbers3[0]) { $0 > $1 ? $0 : $1 }
print(largestNumber)

/*
🕹 Join
Join all the strings from strings into one using reduce. Add spaces in between strings. Print your result.
> var strings = ["We", "Heart", "Swift"]
> "We Heart Swift"
*/
var stringsToJoin = ["Diego", "Janjardi", "Briz", "Llopis"]
var string = stringsToJoin.reduce("") { $0 + "\($1) " }
print(string)

/*
🕹 Chains
Find the sum of the squares of all the odd numbers from numbers and then print it. Use map, filter and reduce to solve this problem.
> var numbers = [1, 2, 3, 4, 5, 6]
> 25 // 1 + 9 + 25 -> 35
*/
var numbers4 = [1, 2, 3, 4, 5, 6]
var oddNumbers = numbers4.filter() { $0 % 2 != 0}
var oddSquareNumbers = oddNumbers.map() { $0 * $0 }
var resultOdd = oddSquareNumbers.reduce(0) { $0 + $1 }

/*
🕹 For each
Implement a function forEach(array: [Int], _ closure: Int -> ()) that takes an array of integers and a closure and runs the closure for each element of the array.
var array = [1,2,3,4]
forEach(array) {
    print($0 + 1)
}
// This will be printed:
// 2
// 3
// 4
*/
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
func forEach(array: [Int], _ closure: (Int) -> ()) {
    for num in array {
        closure(num)
    }
}
forEach(array: array) { print($0 * 3) }
