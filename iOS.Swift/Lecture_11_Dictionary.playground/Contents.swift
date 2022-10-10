import UIKit

// Collection Types
// 집합 타입

// Dictionary
// Any : 어떤 타입이든 올 수 있따.
var namesOfStreet = [ String : Any ]()

namesOfStreet["302ro"] = "1st Street"
namesOfStreet["303ro"] = "2nd Street"
namesOfStreet["304ro"] = 3

// 해당 키의 값을 가지고 올 때
namesOfStreet["304ro"]

// 해당 키의 값은 기본적으로 nil이다.
// 따라서 Dictionary를 처리할 때 기본적으로 nil 처리를 해야 한다.
// 그리고 Ditcionary 값이 없을 때도 nil로 처리되기 때문에
// Crash가 발생하지는 않는다(array와는 다른 점)
namesOfStreet["305ro"] = nil

// 305ro가 나오지는 않는다.
// nil로 넣었다고 해서 값이 nil로 초기화 되지는 않음
namesOfStreet

// initialize
var namesOfStreet2 = ["a" : 1, "b" : 2, "c" : 3]

for dic in namesOfStreet {
    print(dic)
    print(dic.key)
    print(dic.value)
}

for key in namesOfStreet.keys {
    print(key)
}

for value in namesOfStreet.values {
    print(value)
}
