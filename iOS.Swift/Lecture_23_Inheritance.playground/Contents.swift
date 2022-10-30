import UIKit

// inheritance
// 상속 - class

// protocol

class UserInfo {
    var name = ""
    var age = 0
    func isAdult() -> Bool {
        return age > 19
    }
}

class Guest: UserInfo {
    override func isAdult() -> Bool {
        return true
    }
    
    func present() {
        name = "kim"
        print(name)
        print(super.name)
        print(age)
        print(isAdult())        // true
        print(super.isAdult())  // false
    }
}

let guest = Guest()
guest.present()
