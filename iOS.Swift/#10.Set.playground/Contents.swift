import UIKit

// Collection Types
// 집합 타입

// Set
// 교집합 합집합, 값을 뺄 때 유리하게 사용될 수 있다.

var names = Set<String>()
names.insert("kim")
names.insert("min")
names.insert("lee")
names.insert("lee")
names.insert("lee")
names.insert("lee") // 같은 값을 넣어도 결국 1개만 할당이 됨

// array에서 같은 값을 없애고 싶을 때
var sameNames = ["lee", "lee", "kim", "lee"]
Set(sameNames) // Set으로 casting을 하면 중복된 값은 삭제 된다.

// 타입을 Set으로만 만들어 주면 array가 set 타입으로 변경된다.
var names2: Set = ["lee", "kim", "min"]

var numbers1: Set = [1, 2, 3, 4, 5]
var numbers2: Set = [4, 5, 6, 7, 8]

// 교집합
numbers1.intersection(numbers2) // 4, 5

// 합집합 -> 같은 값은 허용 안한 상태에서 합집합을 만들어 준다.
numbers1.union(numbers2) // 8, 7, 6, 5, 1, 3, 4, 2

// 합집합 - 교집합(대칭차 집합)
numbers1.symmetricDifference(numbers2) // 1 8 3 7 2 6

// 여집합
numbers1.subtracting(numbers2) // 3 2 1

