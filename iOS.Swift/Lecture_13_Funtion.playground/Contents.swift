import UIKit

// Function (함수)

// 계산기 -> class
// 각 기능 -> Function

let a = 10
let b = 20

var c = 0

func plus(num1 : Int, num2 : Int) -> (String, Int) {
    print("sum = ", num1 + num2)
    c = num1 + num2
    return ("결과 값은", num1 + num2)
}

// 인자 이름을 호출하는 쪽에서 안쓰고 싶을 때는 '_'을 파라미터 변수 앞에 붙이면 된다.
// 파라미터의 타입이 명확할 때는 '_'을 붙이면 유용하다.
func plus2(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}

let sum = plus2(a, b)


func sum(_ num1 : Int, _ num2 : Int) -> Int {
    return num1 + num2
}

func minus(_ num1 : Int, _ num2 : Int) -> Int {
    return num1 - num2
}

func multiply(_ num1 : Int, _ num2 : Int) -> Int {
    return num1 * num2
}

var inputButtonType = "+"

if inputButtonType == "+" {
    displayCalc(result: sum)
} else if inputButtonType == "-" {
    displayCalc(result: minus)
} else if inputButtonType == "*" {
    displayCalc(result: multiply)
}

func displayCalc(result: (Int, Int) -> Int) {
    print("연산 결과", result(a, b))
}
