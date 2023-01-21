import UIKit

// String

let myName = "lee"

for character in myName {
    print(character)
}

let myName2 = "kim"


let name = myName + myName2


let myName3 = "kim\nin\ndd"

let myLongStr =
"""
hi
   hello
welcome
"""
print(myLongStr)

let isOn = false
isOn.description // 값의 string 값(toString)

let myNumber = 123
myNumber.description // "123"

String(myNumber) // change to string

"my number is \(myNumber)".last // 가장 마지막 글자
"my number is \(myNumber)".dropLast() // 가장 마지막 글자를 버림

let myNumber2 = 12.33
String(myNumber2).split(separator: ".")
