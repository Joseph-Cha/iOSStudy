import UIKit


// generic
// 로직 - 반복, 타입이 여러가지 일 때 사용

// stack
struct MyStack<T> where T : Equatable {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T? {
        if items.count < 1 {
            return nil
        }
        return items.removeLast()
    }
}

var myIntStack = MyStack<Int>()

myIntStack.push(item: 4)
myIntStack.push(item: 5)
myIntStack.push(item: 6)

myIntStack.pop()
myIntStack.pop()
myIntStack.pop()

var myStringStack = MyStack<String>()

myStringStack.push(item: "Something")
myStringStack.push(item: "else")

myStringStack.pop()
myStringStack.pop()
