import UIKit

// Class

class MyInfo {
    
    // 생성자
    init(gender: GenderType) {
        self.genderType = gender
    }
    
    // enum이 class 내부에 선언되면 class 내부에서만 사용이 가능하다.
    enum GenderType {
        case male
        case female
    }
    
    // 접근 불가
    private var genderType: GenderType
    
    var name = ""
    var age = 0
    
    func isAdult() -> Bool {
        return age > 19
    }
}

// 참조 (reference type)
var myInfo = MyInfo(gender: .female)
myInfo.age = 20

var myInfo2 = myInfo
myInfo2.age = 30

print(myInfo.age)


// Class - Inheritance

class GameInfo {
    var homeScore = 0
    var awayScore = 0
    
    
    func presentScore() -> String {
        return homeScore.description + " : " + awayScore.description
    }
    
    // override 금지
    final func presentScore(homeScore: Int, awayScore: Int) -> String {
        return homeScore.description + " : " + awayScore.description
    }
}

class Soccer: GameInfo {
    var time = 0
    
}

class Baseball: GameInfo  {
    var round = 0
    
    override func presentScore() -> String {
        return homeScore.description + " 대 " + awayScore.description
    }
}

class Football: GameInfo  {
    
}

let soccer = Soccer()

soccer.awayScore = 1
soccer.homeScore = 2
soccer.time = 45
soccer.presentScore()

let baseball = Baseball()

baseball.homeScore = 2
baseball.awayScore = 1
baseball.round = 3
baseball.presentScore()
