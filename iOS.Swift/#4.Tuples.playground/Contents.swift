import UIKit

var greeting = "Hello, playground"

// Tuples (n짝, n쌍)

var topTitle = ("메인화면", "mainIcon.png")

topTitle.0
topTitle.1

// http status code
// Tuples에서 들어가는 값에 이름을 아래와 같이 만들어 줄 수 있다.
var httpError = (statusCode: 404, descriptions: "Page not found")
httpError.statusCode
httpError.descriptions
