import UIKit

//
// Tuples
//

// A tuple is a group of zero or more values represented as one value

let error = (404, "Not Found")

// You can access via index
let code = error.0 // 404
let codeText = error.1 // "Not Found"

// Or named parameters
var person = (firstName: "Diego", lastName: "Llopis")
var firstName = person.firstName // "Diego"
var lastName = person.lastName // "Llopis"

// Define like any other variable. Can change if a var.
var point = (0,0)
point.0 = 10
point.1 = 30

point // (10, 30)

// Tuples are value types. When you initialize one type with another you get a copy.
var origin = (0,0)

var origin1 = origin
origin1.0 = 20
origin1.1 = 56

origin // (0,0)
origin1 // (20,56)

// Tuples have type
let aTuple = ("tuple", 1, true) // (String, Int, Bool)

// An empty tuple () represents type Void

// Can be decomposed
let aPerson = (firstN: "John", lastN: "Smith")

let (firstN, lastN) = aPerson

firstN
lastN

// We can ignore part of the tuple we don't care
let (onlyFirstName, _) = aPerson
let (_, onlyLastName) = aPerson

onlyFirstName
onlyLastName

/*
  _____          _         _                  _
 |_   _|  _ _ __| |___    /_\  _ _ __ __ _ __| |___
   | || || | '_ \ / -_)  / _ \| '_/ _/ _` / _` / -_)
   |_| \_,_| .__/_\___| /_/ \_\_| \__\__,_\__,_\___|
           |_|
 */

/*
🕹 Status code
 
 Write a method called getStatusCode() that returns a hard coded tuple of type (Int, String) containing values 400 and "Not found". Unpack the tuple, and print out the returned values.
 > func getStatusCode() -> tuple {
    // create and retrn tuple here
 }
*/
func getStatusCode() -> (code: Int, description: String) {
    (400, "Not Found")
}

let status = getStatusCode()
status.0
status.1
status.code
status.description

/*
🕹 Class to tuple
 Convert the following class into a light weight tuple.
 
 class Flight {
     var airport:String
     var airplane:Int
 }
 Use the class variable names as tuple named parameters, and print out the flight details in a print statement.
*/
let flight = (airport: "Cumbica", airplane: "Boeing 747 Plus Max")
print("You'll fly in a \(flight.airplane), leaving from \(flight.airport) airport")
