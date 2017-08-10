//: Playground - noun: a place where people can play

import UIKit



func isPositive(value: Int) -> Bool {
    return value > 0
}
let array = [-4,-2,0,4,7,-8,3].filter(isPositive)


//如果某个数字能被 N 整除，我们希望该函数能返回true，如何实现呢？当然，我们可以写出类似 isEven， isMultipleOf3 和 isMultipleOf4 这样的函数，但是这样的函数是无穷无尽的。
//另一种显而易见的解决方案是把整数 N 作为一个参数传入。以这种思路，我们可以写出如下的函数：
func isMultiple(multiple: Int, value: Int) -> Bool {
    return value % multiple == 0
}

//[-4,-2,0,4,7,-8,3].filter(isMultiple)
////错误：filter 方法期望传入 Int->Bool ，但是我们给的是 (Int,Int)->Bool
//[-4,-2,0,4,7,-8,3].filter(isMultiple(3, value: <#Int#>))
////错误：不能只传入一个参数来调用 `isMultiple`，需要传入两个参数

//func isMultiple(multiplier: Int) -> ((Int) -> Bool) {
//    func multFunctionToReturn(value: Int) -> Bool {
//        return value % multiplier == 0
//    }
//    return multFunctionToReturn
//}

//精简写法,在 Swift 当中，函数和闭包是可以互换的，因此，我们可以直接在函数中返回一个 Int -> Bool 类型的闭包：
func isMultiple(multiplier: Int) -> ((Int) -> Bool) {
    return { (value: Int) -> Bool in
        value % multiplier == 0
    }
}


//柯里化
//柯里化可以将一个接收多个参数的函数转化一个只接收一个参数的函数，同时返回另一个函数（返回的函数将接收原函数的下一个参数，再返回一个函数… 直到所有的参数都被消耗掉，并返回一个最终的值）。这种技术可以让我们实现某个函数的部分功能，这在某些情况下是十分强大和有用的。
//在 Swift 中，我们可以轻松地将一个接收多个参数的方法转化成柯里化的方法，只要将分隔参数的逗号替换成一个闭括号，紧接着再添加一个开括号。现在，让我们复用第一个 isMultiple 函数的实现，并将它转化成柯里化的函数：
func isMultiple(multiplier: Int)(value: Int) -> Bool {
    return value % multiplier == 0
}

//这种语法会让人觉得有点困扰，所以就个人来讲，我还是偏向显式地使用返回函数的函数(就像在上一小节中的形式)，因此，柯里化的函数可以等价地转化为如下的形式(我觉得这种形式更易懂)：
func isMultiple(multiplier: Int) -> (value: Int) -> Bool {
    return { value in value % multiplier == 0 }
}



