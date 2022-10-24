import UIKit

// Extension
// 기능 확장
// struct, class, enum, protocol

// 숫자(int) 짝수, 홀수
// extention Type의 형태로 만든다.
extension Int {
    var oddOrEven: String {
        if self % 2 == 0 {
            return "짝수"
        } else {
            return "홀수"
        }
    }
}

3.oddOrEven
4.oddOrEven

// UIColor
// mainColor1 = xxx
// mainColor2 = xxx
// subColor2 = xxx

extension UIColor {
    var mainColor1: UIColor {
        UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
    }
    // extension을 사용할 때 class 키워드를 붙여서 아래와 같이 바로 접근을 할 수 있도록
    // 사용하는 경우가 많다.
    class var mainColor2: UIColor {
        UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
    }
    
    // static -> type property 인스턴스를 만들지 않더라도 접근 가능
    static var mainColor3: UIColor {
        UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
    }
}

var button = UIButton()

button.titleLabel?.textColor = UIColor().mainColor1
button.titleLabel?.textColor = UIColor.mainColor2
button.titleLabel?.textColor = .mainColor2
button.titleLabel?.textColor = .mainColor3
button.titleLabel?.textColor = .orange
