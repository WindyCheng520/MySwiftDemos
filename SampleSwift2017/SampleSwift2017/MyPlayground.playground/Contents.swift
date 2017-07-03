//: Playground - noun: a place where people can play

import UIKit

let nestedArray = [[1,2,3], [4,5,6]]
let flattenedArray = nestedArray.flatMap { $0 }
flattenedArray // [1, 2, 3, 4, 5, 6]


let nestedArray1 = [[1,2,3], [4,5,6]]

let multipliedFlattenedArray = nestedArray.flatMap { $0.map { $0 * 2 } }
multipliedFlattenedArray // [2, 4, 6, 8, 10, 12]


let nestedArray2 = [[1,2,3], [4,5,6]]

let multipliedFlattenedArray2 = nestedArray.flatMap { array in
    array.map { element in
        element * 2 }
}
multipliedFlattenedArray // [2, 4, 6, 8, 10, 12]

//移除 nil/可选值:。它会接受一个可选类型的数组并返回一个拆包过的且没有nil值的可选类型组成的数组。
let optionalInts: [Int?] = [1, 2, nil, 4, nil, 5]
let ints = optionalInts.flatMap { $0 }
ints // [1, 2, 4, 5] - this is an [Int]
//他认为flatMap是在处理一个容器而不是数组，这样可以更好地理解它。



/* 函数式代码只描述了一件事情：没有副作用。 */
/// 非函数式的 ///
var a = 0
func incrementUnfunctional() -> () {
    a += 1
}
incrementUnfunctional()
print(a) // a = 1
/// 函数式的 ///
a = 0
func incrementFunctional(num: Int) -> Int {
    return num + 1
}
a = incrementFunctional(num: a)
print(a) // a = 1



/* 不要在列表中使用循环，使用 map 和 reduce。 */
// Map 例子 #1
var languages = ["Objective-C", "Java", "Smalltalk"]
let languageLengths = languages.map { language in language.characters.count }
print(languageLengths) // [11, 4, 9]
let squares = [0, 1, 2, 3, 4].map { x in x * x }
print(squares) // [0, 1, 4, 9, 16]



/* 不要在列表中使用循环，使用 map 和 reduce。 */
// Map 例子 #2
// 辅助方法
func randomElement(array: [String]) -> String {
    let randomIndex = randomPositiveNumberUpTo(upperBound: array.count)
    return array[randomIndex]
}
func randomPositiveNumberUpTo(upperBound: Int) -> Int {
    return Int(arc4random_uniform(UInt32(upperBound)))
}

var languages1 = ["Objective-C", "Java", "Smalltalk"]
let newLanguages = ["Swift", "Haskell", "Erlang"]
/// 非函数式的 ///
for index in 0..<languages.count {
    languages[index] = randomElement(array: newLanguages)
}
print(languages) // e.g. ["Haskell", "Haskell", "Swift"]
/// 函数式的 ///
let randomLanguages = languages.map { _ in randomElement(array: newLanguages) }
print(randomLanguages) // e.g. ["Haskell", "Haskell", "Swift"]


/* 不要在列表中使用循环，使用 map 和 reduce。 */
// Reduce 例子 #1
let sum = [0, 1, 2, 3, 4].reduce(0, { $0 + $1 })
print(sum) // 10
let sum1 = [0, 1, 2, 3, 4].reduce(0, +)
sum1


/* 不要在列表中使用循环，使用map和reduce。 */
// Reduce 例子 #1 - 没有参数名称缩写
let numbers = [0, 1, 2, 3, 4]
let startingWith = 0
let sum0 = numbers.reduce(startingWith) {
    (runningSum, currentNumber) in
    runningSum + currentNumber
}
print(sum0) // 10



/* 不要在列表中使用循环，使用 map 和 reduce。 */
// Reduce 例子 #2

// 协助代码
func string(str: String, contains: String) -> Bool {
    return str.lowercased().range(of: contains.lowercased()) != nil
    
}

let greetings = ["Hello, World", "Hello, Swift", "Later, Objective-C"]
/// 非函数式的 ///
var helloCount = 0
for greeting in greetings {
    if(string(str: greeting, contains:"hello")) {
        helloCount += 1
    }
}
print(helloCount) // 2
/// 函数式的 ///
let helloCountFunctional = greetings.reduce(0, { $0 + ((string(str: $1, contains:"hello")) ? 1 : 0) })
print(helloCountFunctional) // 2

struct TodoListParser {
    
    enum Errors: Error {
        case InvalidJSON
    }
    
    func TodoList() {
    }
    
    func parse(fromData data: NSData) throws -> TodoList {
        
        guard let jsonDict = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? [String : AnyObject],
            // Notice the extra question mark here!
            let todoListDict = jsonDict?["todos"] as? [[String : AnyObject]] else {
                throw Errors.InvalidJSON
        }
        
        let todoItems = todoListDict.flatMap { TodoListParser().parse(fromData: $0) }
        
        return TodoList(items: todoItems)
        
    }
}


let minionImagesFlattened = (1...7).flatMap { UIImage(named: "minionIcon-\($0)") }






