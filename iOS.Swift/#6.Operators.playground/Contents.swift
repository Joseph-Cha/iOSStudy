import UIKit

var greeting = "Hello, playground"

// 기초 연산자

// + - * / %(remainder Operator)

// Swift 언어 특징
// 타입이 엄격하다.
// 따라서 연산자를 사용할 때 같은 타입을 사용해야 한다.
let a: Int = 20
let b: Double = 30

// 나누기를 할 때 타입을 고려해서 사용해야 한다.
// 즉 같은 타입을 사용
let c = a / Int(b)

let aa = "hi"
let bb = " hello"
let cc = aa + bb

// %
// 홀수 짝수
if a % 2 == 0 {
    print("짝수")
} else {
    print("홀수")
}

// double에서 사용하는 % 연산자
if b.truncatingRemainder(dividingBy: 2) == 0 {
    print("짝수")
} else {
    print("홀수")
}

var d: Int = 20

d = d + 2
d += 2

d = d - 2
d -= 2


// 비교 연산자
// 문자들 또한 유니 코드로 치환시키면 일종의 숫자이기 때문에 서로 비교가 가능하다.
let aaa = "a"
let bbb = "b"

// Boolean
(aaa == bbb) // 같다

(aaa != bbb)

aaa > bbb
aaa < bbb
aaa >= bbb
aaa <= bbb

if aaa > bbb {
    
} else {
    
}

// unicode
"\u{61}" // a
"\u{62}" // b
"\u{63}" // c


