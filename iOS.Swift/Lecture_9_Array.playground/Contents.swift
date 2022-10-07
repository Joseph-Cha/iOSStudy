import UIKit

// Collection Types
// 집합 타입

// Array
// type safe
var myNames = Array<String>()
// 위 아래 모두 동일
var myAges = [Int]()

var emptyDoubles: [Double] = []
let oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15]
var emptyFloats: Array<Float> = Array()

myNames.append("kim")
myNames.append("lee")
myNames.append("jin")

let index = 3


myNames[0]
myNames[1] + "님"

// 방어 코드
if myNames.count > index {
    myNames[index]
}

// array를 직접 추가할 수 있음
myNames.append(contentsOf: ["hi", "hello"])
// 위 아래 모두 동일
myNames = myNames + ["hi", "hello"]

myNames.remove(at: 0) // 첫번째 제거
myNames.removeAll()   // 모두 제거
myNames.removeLast()  // 마지막 제거

// 값이 있냐
if myNames.count > 0 {
    print("값이 있음")
}

// 값이 없냐
if myNames.isEmpty == true {
    
}

// 원하는 위치에 값을 추가
myNames.insert("hahaha", at: 3)

// index와 value를 같이 가지고 오는 방법
for (index, name) in myNames.enumerated() {
    print(index, name + "님")
}
