import UIKit

// Deinitialization
// 해제

var a: Int? = 10
a = nil // 변수를 메모리에서 해제

class Game {
    var score = 0
    var name = ""
    var round: Round?
    
    init () {
        print("game init")
    }
    
    // 소멸자
    deinit {
        print("game deinit")
    }
}

class Round {
    // weak 키워드 -> 현재 참조하고 있는 객체가 해제되면
    // 현재 자신도 해제를 시켜준다.
    // Round는 게임에 의존적이기 때문에
    // 현재 게임이라는 객체가 해제되면 Round도 소멸되는 것이 마땅한 상황이다.
    // 따라서 현재 Round가 들고 있는 Game 객체에 weak라는 키워드를 넣어줌으로써
    // Game이 소멸될 때 Round도 소멸될 수 있도록 해주는 것이다.
    // weak를 잘 사용해야 메모리를 효율적으로 관리할 수 있다.
    weak var gameInfo: Game?
    var lastRound = 10
    var roundTime = 20
    
    deinit {
        print("round deinit")
    }
}

var game: Game? = Game()
var round: Round? = Round()

game?.round = round
round?.gameInfo = game

// 필요 없는 객체를 nil로 초기화 하면 메모리에서 해제된다.
// 위와 같이 상호 참조인 상태, 즉 game.round에서 round에 있는(현재 메모리에 있는) 데이터를
// 참조하고 있기 때문에 초기화 되지 않는다.
game = nil
round = nil

// 객체가 언제 메모리에서 해제가 될까?
// Retain Count가 0일 때, 즉 해당 객체를 참조하고 있는 곳이 아무도 없을 때
