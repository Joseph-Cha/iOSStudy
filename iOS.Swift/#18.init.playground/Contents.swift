import UIKit

// Initializer

// 생성자
// init

class MyInfo {
    var name: String
    let myId: String
    
    var age: Int?
    var isAdult: Bool
    
    // designed initializer
    init(name: String, myId: String) {
        self.name = name
        self.myId = myId
        self.age = 10 + 5 + 10
        self.isAdult = ((age ?? 0) > 19) ? true : false
    }
    
    // convenience initializer
    // 필수 조건 - 다른 init을 반드시 실행해야 한다.
    // 다른 버전의 init을 만들어도 꼭 실행해야하는 init을 실행 시킬 수 있는
    // convenience initializer를 사용하면 된다.
    convenience init() {
        self.init(name: "", myId: "")
    }
    
    convenience init(id: String) {
        self.init(name: "", myId: id)
    }
}

var myinfo1 = MyInfo(name: "동훈", myId: "absd")
var myInfo2 = MyInfo()
var myInfo3 = MyInfo(id: "some id")

myinfo1.myId
myinfo1.name

// struct인 경우 init을 안만들어도 자동으로 만들어진다.
struct MyConfig {
    var conf: String
}

var myCon = MyConfig(conf: "xxxx")
var myCon2 = MyConfig.init(conf: "xxx")
