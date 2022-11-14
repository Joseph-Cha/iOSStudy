import UIKit


// Higher order functions
// Almost same concept of Linq(C#)
let names = ["kim", "lee", "min", "john"]

// map -> you can change style of array's value of names
let names2 = names.map { name in
    name + "nim"
}

// closure syntax
let names2_1 = names.map { $0 + "nim" }

let names3 = names.map { name in
    name.count
}

let names4 = names.map { name in
    name.count > 3
}

// filter -> get wanted value
let filterName = names.filter{ (name) in
    name.count > 3
}
filterName // john

// reduce -> merge target to one object(+ , -)
let sumName = names.reduce("") { first, second in
    return first + second
} // kimleeminjohn

// start with aaa
let sumName2 = names.reduce("aaa") { first, second in
    return first + second
} // aaaakimleeminjohn

// summarized
let sumName3 = names.reduce("aaa") { $0 + $1 }
sumName3 // aaaakimleeminjohn

let numberArr = [ 1, 2, 3, 4, 5, nil, 6, nil, 8 ]
let sumNum = numberArr.reduce(0) { $0 + ($1 ?? 0) }
sumNum // 29

// compactMap -> remove nil and optional
let numbers = numberArr.compactMap { (num) in
    return num
}
let numbers2 = numberArr.compactMap { $0 }

// flatmap
// change 2D array to 1D array
let numbers3 = [[1,2,3], [4,5,6]]
let flatNum = numbers3.flatMap { $0 }
flatNum // [1, 2, 3, 4, 5, 6]
