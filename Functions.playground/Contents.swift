import UIKit
//
// Functions
//


func greet(person: String, day: String) -> String {
    "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")


// - Ready Player 1
//
// Remove the "day" parameter. Add a parameter to include today's lunch
// special in the greeting
func greet(person: String, special: String) -> String {
    "Hello \(person), today's lunch special is \(special)."
}
greet(person: "Bob", special: "Tacos")


//Omitting the prefix
func greet(_ person: String, _ special: String) -> String {
    "Hello \(person), today's lunch special is \(special)."
}
greet("Alicia", "Chicken Wings")


//Argument Labels and Parameter Names
func greet(person: String, from hometown: String) -> String {
    "Hello \(person)! Glad you could visit from \(hometown)"
}
greet(person: "Diego", from: "Mogi das Cruzes")


// - Ready Player 1
//
// Add an argument label of "to" to the "person" parameter name,
// and update the "greet" method accordingly
func greet(to person: String, from hometown: String) -> String {
    "Hello \(person)! Welcome back to your home, \(hometown)"
}
greet(to: "Steve Jobs", from: "Cuppertino")


// Default Parameter Values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 4) //parameterWithDefault is 4
someFunction(parameterWithoutDefault: 14) //parameterWithDefault is 12


//
// Advanced: Function Types
//
// Every function has a specific type, made up of the parameter types and the return type of the function
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    a * b
}

// The type of both of these functions is (Int, Int) -> Int. This can be read as:
// "A function that has two parameters, both of type Int, and that returns a value of type Int."

// Here's another example, for a function with no parameters or return value:
func printHelloWorld() {
    print("Hello, world!")
}

// Note: The type of this function is () -> Void,
// or "a function that has no parameters, and returns Void."
// Which means even through there is no return, the return type is still of type Void.


// Using Function Types
// Function can be assigned types
func addInts(a: Int, b: Int) -> Int {
    return a + b
}

var mathFunction: (Int, Int) -> Int = addInts
mathFunction(2,4)

// Functions as parameters
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func beetweenOneAndTen(number: Int) -> Bool {
    number >= 1 && number <= 10
}

func lessThanTen(number: Int) -> Bool {
    number < 20
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: beetweenOneAndTen)
hasAnyMatches(list: numbers, condition: lessThanTen)

/*
  ___             _   _              _                  _
 | __|  _ _ _  __| |_(_)___ _ _     /_\  _ _ __ __ _ __| |___
 | _| || | ' \/ _|  _| / _ \ ' \   / _ \| '_/ _/ _` / _` / -_)
 |_| \_,_|_||_\__|\__|_\___/_||_| /_/ \_\_| \__\__,_\__,_\___|
 */

/*
🕹 Min
Write a function named min2 that takes two Int values, a and b, and returns the smallest one. Use _ to ignore the external parameter names for both a and b.
 
 > min(1,2)
 > 1
*/
func min2(_ a: Int, _ b: Int) -> Int {
    a < b ? a : b
}
min2(2, 20)

/*
🕹 Last Digit
Write a function that takes an Int and returns it’s last digit. Name the function lastDigit. Use _ to ignore the external parameter name.
 > lastDigit(12345)                     Hint: % modulus operator
 > 5
 */
func lastDigit(_ number: Int) -> Int {
    number % 10
}
lastDigit(12347)

/*
🕹 First Numbers
Write a function named first that takes an Int named N and returns an array with the first N numbers starting from 1. Use _ to ignore the external parameter name.
 > first(3)
 > [1, 2, 3]
*/
func first(_ n: Int) -> [Int] {
    var list = [Int]()
    for number in 1...n {
        list.append(number)
    }
    return list
}
first(4)

/*
🕹 Reverse
Write a function named reverse that takes an array of integers named numbers as a parameter. The function should return an array with the numbers from numbers in reverse order.
 > reverse([1, 2, 3])
 > [3, 2, 1]
 */
func reverse(numbers: [Int]) -> [Int] {
    var list = [Int]()
    var counter = numbers.count - 1
    while counter >= 0 {
        list.append(numbers[counter])
        counter -= 1
    }
    return list
}
reverse(numbers: [1,2,3,4,5,6])

/*
🕹 Sum
Write a function named sum that takes an array of integers and returns their sum. Use a label variable of the word 'of' and a parameter label named numbers.
 > sum(of: [1, 2, 3])
 > 6
 */
func sum(of numbers: [Int]) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sum(of: [1,2,3,4,5,6])
