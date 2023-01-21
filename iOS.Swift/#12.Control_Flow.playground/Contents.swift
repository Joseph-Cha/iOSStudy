import UIKit

// Control Flow (흐름 제어)

// for

let name = "23442323"

for char in name {
    print(Int(String(char))! * 10)
}

let names = ["lee", "kim", "min"]
for name in names {
    print(name + "님")
}

let numberOfLegs = ["ant" : 6, "dog" : 4]

for dic in numberOfLegs {
    print(dic)
}

for index in 0...5 {
    print(index) // 0 1 2 3 4 5
}

for index in 0..<5 {
    print(index) // 0 1 2 3 4
}

let names2 = ["kim", "lee", "hen"]
for index in 0..<names.count {
    print(names2[index])
}

var a = 0

// 무한으로 반복문 안에서 계속 실행되는 경우
while a < 10 {
    a += 1
    print(a)
}

// switch
// 조건에 대한 케이스를 만들어서 분기 처리\
let b = "a"
switch b {
case "b":
    print("b")
// 여러 조건 중 하나에 부합한지
case "a", "c", "d":
    print("a or c or d")
default:
    print("other")
}

let c = 2
switch c {
case 1:
    print("1")
// 여러 조건 중 하나에 부합한지
case 2...5:
    print("2~5")
default:
    print("other")
}
