import UIKit

// Enumerations

// enum
// 타입 분류

// 도서관 -> 항목 -> 소설, 문제집, 패션, 만화책

// 분류 + 값
enum BookType {
    case fiction(title: String, price: Int, year: Int)
    case comics(title: String, price: Int, year: Int)
    case workbook(title: String, price: Int, year: Int)
    // ....
}

// enum에 있는 케이스의 값을 그대로 가지오 오고 싶을 때
extension BookType {
    var typeName: String {
        switch self {
        case .comics:
            return "comics"
        case .fiction:
            return "fiction"
        case .workbook:
            return "workbook"
        }
    }
}

// comics가 기본 타입일 때
var normalBookStyle = BookType.comics
// 기본 타입을 모를 때
var bookStyle: BookType?

var books = [BookType]()

func saveBook(book: BookType) {
    books.append(book)
}

saveBook(book: .comics(title: "AA", price: 5000, year: 2020))
saveBook(book: .comics(title: "BB", price: 6000, year: 2021))
saveBook(book: .comics(title: "CC", price: 7000, year: 2022))

saveBook(book: .workbook(title: "DD", price: 3000, year: 2015))
saveBook(book: .fiction(title: "EE", price: 2000, year: 2014))
saveBook(book: .fiction(title: "FF", price: 1000, year: 2020))

for book in books {
    
    // switch case 문을 하나만 사용하고 싶을 때 사용할 수 있는 방법
    // book에서 abc 값을 가지고 온다.
    // cf) if let a = b -> b 값이 있으면 a에 할당 후 사용
    if case let BookType.comics(title, _, _) = book {
        print(title, book.typeName)
    }
    
    switch book {
    // case let을 사용하면 enum에 있는 값을 가지고 올 수 있음
    case let .comics(_, price, _):
        print(price)
    case let .fiction(title, _, _):
        print(title)
    case let .workbook(_, _, year):
        print(year)
    }
}
