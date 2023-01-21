import UIKit

// Closure (클로저)

// func - 유사
// closure - 이름이 없음(무명 함수)

// func
func myScore(a: Int) -> String {
    return "\(a)점"
}

let myFunc = myScore

myFunc(40)

// closure
var myScore2 = { (a: Int) -> String in
    return "\(a)"
}

myScore2(40)

if type(of: myFunc) == type(of: myScore2) {
    print("같다")
}

/*
 다양한 closure의 형태들(축약을 통한 형태 변환)
 */

// 축약 (생략)
var myScore3 = { (a: Int) -> String in
    // return 라인이 한줄일 때 생략 가능
    "\(a)"
}

// 리턴 타입 추론 가능
var myScore4 = { (a: Int) in
    // return 라인이 한줄일 때 생략 가능
    "\(a)"
}

// 함수의 타입을 명시적으로 지정을 해주면 함수 본문을 아래와 같이 줄일 수 있다.
let myScore5: (Int, Int) -> String = { (a, b) in
    "\(a + b)점"
}

// $0 == 첫 번째 파라미터 값
// 받는 파라미터 값을 $n을 통해 생략할 수 있다.
let myScore6: (Int, Int, Int) -> String = {
    "\($0 + $1 + $2)점"
}

// 값을 보고 타입을 추론 가능
var myAge1 = 20

// 타입을 명시적으로 지정
var myAge2: Int = 20

/*
 실제 사용 사례
 */

// 조건 -> 찾는다 -> 특정한 글자가 포함된 것을 찾는다.
// 조건 -> 찾는다 -> 입력한 글자로 시작하는 첫글자

let names = ["apple", "air", "brown", "red", "orange", "blue", "candy"]

let containsSomeText: (String, String) -> Bool = { name, find in
    return name.contains(find)
}

let isStartSomeText: (String, String) -> Bool = { name, find in
    return name.first?.description == find
}

func someFind(find: String) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if name.contains(find) {
            newNames.append(name)
        }
    }
    
    return newNames
}

someFind(find: "a")

func find(findString: String,
          condition: (String, String) -> Bool) -> [String] {
    var newNames = [String]()

    for name in names {
        if condition (name, findString) {
            newNames.append(name)
        }
    }
    return newNames
}

let words = find(findString: "a", condition: containsSomeText)
let words2 = find(findString: "a", condition: isStartSomeText)

// 실제 적용 사례 2

var names2 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// sorted
// -> Swift에서는 결과가 나올 때 과거형을 사용한다.
// -> 단 대상이 되는 객체의 데이터는 변경하지 않는다(값 복사가 이루어짐)
// -> 값 복사를 하고 싶으면 과거형 API를 사용하면 됨
let sorted = names2.sorted()

// 원본
names2.sort{(lhs, rhs) -> Bool in
    return lhs > rhs
}

// by는 생략된 상태 -> by를 생략하면 () 생략 가능
names2.sort{ $0 < $1 }

names2.sort(){ $0 > $1 }

// 괄호 생략 가능
names2.sort(by: { $0 < $1 })

// "<" 이런 부등호 자체가 closure이기 때문에 가능한 형태
names2.sort(by: < )
