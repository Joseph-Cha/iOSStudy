import UIKit

// protocol
// 규격, 규약, 규칙, 청사진, 뼈대를 잡는다
// 인터페이스와 동일
protocol UserInfo {
    var name: String { get set }
    var age: Int { get }
    
    func isAdult() -> Bool
}

protocol UserScore {
    var score: Int { get set }
}

protocol UserDetailInfo: UserInfo, UserScore {
    var xxxx : String { get set }
}

// protocol에서 구현부가 매번 똑같을 경우
// extension을 사용하면 가능하다.
extension UserInfo {
    func isAdult() -> Bool {
        return self.age > 19
    }
}

class Guest: UserInfo, UserScore {
    var name: String = "kim"
    var age: Int = 20
    var score: Int = 30
}

class Member: UserDetailInfo {
    var xxxx: String = "ddd"
    var score: Int = 30
    var name: String
    // 초기값으로 고정 시킬 때 let을 사용
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class VIPMember: UserInfo {
    var name: String = "lee"
    var age: Int = 10
    
    // extension에서 정의한 것을 사용하는 것이 아니라
    // 여기서 정의한 것을 사용
    func isAdult() -> Bool {
        return age > 20
    }
}

class UserInfoPresenter {
    func present(userInfo: UserInfo) {
        print("name: " + userInfo.name)
        print("age: " + userInfo.age.description)
        print("Is adult? " + userInfo.isAdult().description)
        print("\n")
    }
}

class UserInfoPresenterEnumerator {
    func present(userInfo: UserInfo) {
        let guest = Guest()
        let member = Member(name: "kim", age: 30)
        let vipMember = VIPMember()
        
        let userInfos: [UserInfo] = [guest, member, vipMember]
        
        for element in userInfos {
            print (element.name)
            print (element.age)
            
        }
    }
}

let present = UserInfoPresenter()

present.present(userInfo: Guest())
present.present(userInfo: Member(name: "park", age: 30))
present.present(userInfo: VIPMember())
