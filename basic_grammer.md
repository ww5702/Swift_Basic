#Swift 기본 문법

참고
Swift Programming Language Guide [Apple Developer / iBooks]
Swift API Design Guidelines [swift.org]


##이름짓기 규칙
Lower Camel Case : function, method, variable, constant
Ex) someVariableName

Upper Camel Case : type(class, struct, enum, extension)
Ex) Person, Point, Week

대소문자를 구분한다.

##콘솔로그
Print = 단순 문자열 출력
Dump =  인스턴스의 자세한 설명(description 프로퍼티)까지 출력

##문자열 보간법
String interpolatioin
프로그램 실행 중 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해 사용
\()

##상수 변수
상수 선언 let
Let 이름: 타입 = 값
값의 타입이 명확하다면 타입 생략 가능
Let 이름 = 값

변수 선언 var
Var 이름: 타입 = 값
값의 타입이 명확하다면 타입 생략 가능
Var 이름 = 값

기본데이터 타입
Bool, Int, Uint, Float, Double, Character, String

Var someBool: Bool = true
true값과 false값 2가지를 가짐
0과 1을 가질 순 없음

Var someInt: Int = -100
말 그대로 정수값

Var someUInt = 100
양의 정수

Var someFloat: Float = 3.14
실수값, 3과 같이 정수도 가능

Var someDouble: Double = 3.14
실수값, 3과 같이 정수도 가능, 하지만 Float값 대입 불가

Var someCharacter: Character = “”
“  ”안에 있는 유니코드상 모든 문자 가능
하지만 문자를 여러개 넣는건 불가

Var someString: String = “문자 문자 문자”
여러 문자 가능
String에 Character값 대입도 불가

Any = swift의 모든 타입을 지칭하는 키워드
AnyObject = 모든 클래스 타입을 지칭하는 프로토콜
Nil = 없음을 의미하는 키워드, null과 유사한것

Var someAny: Any = 100
someAny = “어떤 타입도 수용 가능”
someAny = 123.12

컬렉션 타입
Array, Dictionary, Set

Array = 순서가 있는 리스트 컬렉션
Dictionary = 키와 값의 쌍으로 이루어진 컬렉션
Set = 순서가 없고, 멤버가 유일한 컬렉션

Var integers: Array<Int> = Array<Int>()
Integers.append()
Integers.contains() 포함하고 있는가 -> true, false로 출력됨
Integers,remove()
integers.count()
비어있는 상태에서 integers[0]과 같이 표현 불가

Var anyDictionary: Dictionary<String, Any> = [String: Any]()
//Key가 String타입이고 Value가 Any인 Dictionary 생성
anyDictionary[“someKey’] = “value”
anyDictionary[“anotherKey”] = 100
anyDictionary.removeValue(forKey: “anotherKey”)

Var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(2)
integerSet.insert(2)
-> 1,2 중복된값이 없다

Let union: set<Int> = setA.union(setB) -> set끼리 합칠경우 중복 자동제거
Let sortedUnion: [Int] = union.sorted() -> set 자동 정렬
setA.intersection(setB) -> 중복된 부분 출력
setA.subtracting(setB) -> 차집합 부분 출력

함수 function
func라는 키워드 사용
Func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름 : 매개변수2타입….) -> 반환타입 {
	함수구현부
	return 반환값
}
Func sum(a: Int, b: Int) -> Int {
	return a + b
}
Func printYourName(name: String) {
	print(name)
}
과 같이 생략도 가능
 
매개변수가 없는 경우
Func maximumIntegerValue() -> Int {
	return Int.max
}

함수의 호출
sum(a: 3, b:5)
printYourName(name: “ asdf”)
maximumIntegerValue() 

매개변수 기본값은 매개변수 목록 중에 뒤쪽에 위치하는것이 좋다
Func greeting(friend: String, me: String = “asdf”) {
	print(“Hello \(friend) ! I’m \(me)” )
}
greeting(friend: “zxcv”) // Hello xxcv ! I’m asdf

전달인자 레이블(매개변수 역할을 좀더 명확하게 하거나 사용자의 입장에서 표현하고자 할때 사용)
Func greeting(to friend: String, from me: String = “asdf”) {
	print(“Hello \(friend) ! I’m \(me)” )
}
greeting(to: “zxcv”, from: “asdf”)

전달 받을 값의 개수를 알기 어려울때 가변 매개변수 사용
Func SayHelloToFriends(me: String, friends: String…) -> String {
	return “Hello \(friend) ! I’m \(me)” 
}
print(sayhelloToFriends(me: “asdf”, friends:”xxcv”, “zxcv2”, “zxcv3”))
-> Hello [“xxcv”, “zxcv2”, “zxcv3”]! I’m asdf

스위프트의 함수는 섞어서 사용도 가능
Var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction(“asdf”,”asdf2”) -> hello asdf! I’m asdf2

하지만 타입이 다른 함수는 할당 불가


조건문
If-else, switch
기존의 if 구문과 크게 다를건 없다
if만도 사용가능, 기존과 다른건 소괄호() 가 생략 가능
If condition {
	statements
}else if {
	statements
}else {
	statements
}
조건문에는 항상 Bool 타입이 들어와야 한다

Switch
범위 연산자를 활용하면 더욱 쉽다
Switch someInteger {
Case 0:
	print(“”)
Case 1..<100: //1부터 100까지 
	print(“”)
Case 101…Int.max:
	print(“”)
default:
	print(“”)
}


반복문
For-in, while, repeat-while

For item in items {
	code
}

While condition {
	code
}

Repeat {
	code
}while condition

Do-while 구문을 사용하지 않는 이유는 do-while은 스위프트의 오류처리 구문에서 사용하기 떄문

