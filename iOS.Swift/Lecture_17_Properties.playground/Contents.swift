import UIKit

// Properties
// 프로퍼티

class MyInfo {
    
    // stored property (저장)
    var name = ""
    var age = 0
    
    // lazy stored property
    // lazy 키워드를 사용하면 class 생성 시 해당 속성이 바로 메모리에 올라가지 않고
    // 사용하려는 시점에 메모리에 올려서 사용 할 수 있게 한다.
    lazy var myProfiles = [UIImage(named: "a"),
                           UIImage(named: "b"),
                           UIImage(named: "c"),
                           UIImage(named: "d")]
    
    // computed property (계산)
    // get을 할 때 식을 사용해서 값을 가지고 오는 방식
    var isAdult: Bool {
        return age > 19
    }
    
    // email -> 보안 -> 암호화 된 값으로 사용한다. (항상)
    // set은 생략 가능하지만 get은 생략할 수가 없다.
    var _email: String = ""
    var email: String {
        get {
            return _email
        }
        set {
            _email = newValue.hash.description
        }
    }
}

let myInfo = MyInfo()
myInfo.email = "adb@test.com"
myInfo.age = 10
myInfo.name = "kim"

// 이렇게 사용하려는 시점에 메모리에 올라간다.
myInfo.myProfiles

let yourInfo = MyInfo()
yourInfo.email = "adb@test.com"

if (myInfo.email == yourInfo.email) {
    print("같다")
}

print(myInfo.age)
