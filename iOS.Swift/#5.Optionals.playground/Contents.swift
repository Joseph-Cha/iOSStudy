import UIKit

// Optionals (옵셔널)

// 개념
// 값이 있을 수도 있고, 없을 수도 있다.

// 값이 있다.
// 값이 없다. -> nil

// 0 -> 다쓴 상태인 값

// ?를 붙이면 nil이 될 수 있는 optional 상태이다.
var myAge: Int? = 0

// 값이 없는 상태인지 체크 -> 틀린 로직
if myAge == 0 {
    // alert - 나이를 입력해 주세요.
    
}

// 값이 없는 상태인지 체크 -> 맞는 로직
if myAge == nil {
    
}

var myName: String? = "" // Empty String

// 틀린 로직
if myName == "" {
    // 이름을 입력해 주세요.
}

// 이름 값이 없음
if myName == nil {
    
}

// 옵셔널은 그냥 사용할 수 없는 경우가 많이 있음.

var a: Int? = 10
var b: Int? = 20

// unwrapped
// unwrapping

// Int? -> Int
// String? -> String

// coalese -> nil일 경우 0으로 대체해서 사용
var c = (a ?? 0) + (b ?? 0)

// Force-unwrap
// 주의 사항
// 해당 값이 반드시 값이 있는 상태라는 가정으로 동작
// 만일 값이 없는 상태라면 crash 발생 후 앱이 강제 종료 된다.
var d = a! + b!

// Unwrapping
// if Statements

if a != nil {
    print(a!)
}

// if let
// a에 값이 있으면 unwrapping 후 hasNumber에 값을 받아온 뒤 사용
// 단 hasNumber가 상수로 사용
if let hasNumber = a {
    print(hasNumber)
}

// if var
// a에 값이 있으면 unwrapping 후 hasNumber에 값을 받아온 뒤 사용
// 단 hasNumber가 변수로 사용
if var hasNumber = a {
    hasNumber = hasNumber * 2
    print(hasNumber)
}

// guard let -> 상수
// guard var -> 변수
func testFunc() {
    // a값이 없으면 else문을 동작 시킨다.
    guard let hasNumber = a else {
        return
    }
    print(hasNumber)
}

func testFunc2() {
    // a값이 없으면 else문을 동작 시킨다.
    guard var hasNumber = a else {
        return
    }
    hasNumber = hasNumber * 2
    print(hasNumber)
}

testFunc()

