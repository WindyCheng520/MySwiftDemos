//: Playground - noun: a place where people can play

import UIKit

/*
enum FamilyRelationshipType {
    case GrandFather
    case GrandMother
    case Father
    case Mother
    case Brother
    case Sister
    case Son
    case Daughter
}
 */


//在Swift中是使用rawValue来表示枚举类型的具体值。默认情况下，rawValue会在枚举类型的定义中按自上向下的顺序从 0、1、2 这样每次递增 1。当然，我们也可以自己指定每个枚举类型的rawValue，代码如下：

enum FamilyRelationshipType: Int {
    case GrandFather = 400
    case GrandMother = 500
    case Father = 600
    case Mother = 700
    case Brother = 800
    case Sister = 900
    case Son = 1000
    case Daugther = 1100
}

struct FamilyMember {
    var name: String
    var relationshipType: FamilyRelationshipType
    
    
    init(name: String, relationshipType: FamilyRelationshipType) {
        self.name = name
        self.relationshipType = relationshipType
    }
    
//枚举类型用的最多的地方是在Switch条件语句。举个例子，你要给每个家庭成员赠送礼物，并且有个giftFor函数会根据对方关系的不同来为你推荐不同的礼物。这个推荐礼物的函数如下：
    static func giftFor(member: FamilyMember) -> String {
        switch (member.relationshipType) {
        case .GrandFather:
            return "Book"
        case .GrandMother:
            return "Sweater"
        case .Father:
            return "Shirt"
        case .Mother:
            return "Flowers"
        default:
            return "Choclates"
        }
    }
}

let sister = FamilyMember(name: "Jacky", relationshipType: FamilyRelationshipType.Sister)
let brother = FamilyMember(name: "Jack", relationshipType: FamilyRelationshipType.Brother)



//Swift 中也可以把每个枚举与它的值联合起来。这些联合值(associated values)只可以在Switch语句里使用枚举时访问。它完全不同于之前的rawValue，它不能通过.来读取。这样讲可能有点抽象，回到giftFor函数，现在需要根据家庭成员的年龄大小来决定具体的礼物，使用联合值的枚举可以这样来定义：
enum FamilyRelationshipType1 {
    case GrandFather(age: Int)
    case GrandMother(age: Int)
    case Father(age: Int)
    case Mother(age: Int)
    case Husband(age: Int)
    case Wife(age: Int)
    case Brother(age: Int)
    case Sister(age: Int)
    case Son(age: Int)
    case Daugther(age: Int)
}
//giftFor函数代码如下。其中，我们可以在giftFor函数中使用let或var修饰家庭成员的年龄，并决定推荐什么礼物。为了更容易理解，我把FamilyMember结构体也加进来了。
struct FamilyMember1 {
    var name: String
    var relationshipType: FamilyRelationshipType
    
    init(name: String, relationshipType: FamilyRelationshipType) {
        self.name = name
        self.relationshipType = relationshipType
    }
    
    static func giftFor(member: FamilyMember1) -> String {
        switch (member.relationshipType) {
        case .Brother://(let age):
//            if age > 10 {
//                return "video games"
//            } else {
                return "toys"
//            }
        case .GrandFather:
            return "Book"
        case .GrandMother:
            return "Sweater"
        case .Father:
            return "Shirt"
        case .Mother:
            return "Flowers"
        default:
            return "Choclates"
        }
    }
}

//最后，说一下Swift中枚举最酷的地方，就是在枚举中可以有方法，也可以使用构造器。giftFor函数其实可以从FamilyMember结构内移到FamilyRelationType枚举中去，因为该方法是基于成员关系及其联合值的。对上面的代码进行重构(我同时把函数giftFor也改名为gift)后，最终的代码如下：
enum FamilyRelationshipType3 {
    case GrandFather(age: Int)
    case GrandMother(age: Int)
    case Father(age: Int)
    case Mother(age: Int)
    case Husband(age: Int)
    case Wife(age: Int)
    case Brother(age: Int)
    case Sister(age: Int)
    case Son(age: Int)
    case Daugther(age: Int)
    
    func gift() -> String {
        switch(self) {
        case .Brother(let age):
            if age > 10 {
                return "video games"
            } else {
                return "toys"
            }
        case .GrandFather:
            return "Book"
        case .GrandMother:
            return "Sweater"
        case .Father:
            return "Shirt"
        case .Mother:
            return "Flowers"
        default:
            return "Choclates"
        }
    }
}

struct FamilyMember3 {
    var name: String
    var relationshipType: FamilyRelationshipType3
    
    init(name: String, relationshipType: FamilyRelationshipType3) {
        self.name = name
        self.relationshipType = relationshipType
    }
}


//优雅地设置 IBOutlets
/*
@IBOutlet weak var myLabel: UILabel! {
    didSet {
        myLabel.textColor = UIColor.purpleColor()
    }
}

@IBOutlet weak var myOtherLabel: UILabel! {
    didSet {
        myOtherLabel.textColor = UIColor.yellowColor()
    }
}

@IBOutlet weak var myButton: UIButton! {
    didSet {
        myButton.tintColor = UIColor.magentaColor()
    }
}
*/


