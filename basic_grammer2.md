# Swift 기본 문법 2
   
옵셔널 값 추출, 구조체, 클래스, 열거형, 값 타입 & 참조 타입, 클로저, 프로퍼티, 상속


## 옵셔널 값 추출
Optional Binding, Force Unwrapping(강제추출)   

Optional Binding   
옵셔널 값을 꺼내오는 방법중 하나   
Nil 체크 + 안전한 값 추출   

```
Func printname(_ name: String) {
	print(name)
}
Var myName: String! = nil

If let name: String = myName {
	printName(name)
} else {
	print(“myName == nil”)
}
// name 상수는 if-let 구문 내에서만 사용 가능
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
printName(name)
```

Force Unwrapping   
옵셔널 값을 강제추출   

```
Func printname(_ name: String) {
	print(name)
}
Var myName: String? = “asdf”
printName(myName!) // asdf

myName = nil
print(myName!)
// 강제추출시 값이 없으므로 런타임 오류

Var yourName: String! = nil
printName(yourName)
// nil 값이 전달되기 때문에 런타임 오류
```

## 구조체 struct
Struct 이름 {   
	구현부   
}   
   
```
// 프로퍼티 및 메서드
Struct Sample {
	var mutableProperty: Int = 100 // 가변 프로퍼티
	let immutableProperty: Int = 100 // 불변 프로퍼티
	
	static var typeProperty: Int = 100 // 타입 프로퍼티
	
	//인스턴스 메서드
	func instanceMethod() {
		print(“instance method”)
	}

	// 타입 메서드 
	static func typeMethod() {
		print(“type method”)
	}
}
```

구조체 사용   

```
// 가변 인스턴스
Var mutable: Sample = Sample() 
mutable.mutableProperty = 200
mutable.immutableProperty = 200 // 불변 프로퍼티임으로 오류

// 불변 인스턴스
Let immutable: Sample = Sample()
immutable.mutableProperty = 200 // 둘다
immutable.immutableProperty = 200  // 오류

//타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // 그저 자체적으로 사용가능, 출력 -> type method

mutable.typeProperty = 400
mutable.typeMethod() // 불가능
```
   
   
## 클래스 class
Class 이름 {   
	구현부   
}   
// 구조체는 값타입 클래스는 참조타입인 점이 다르다   
```
Class Sample {
	var mutableProperty: Int = 100 // 가변 프로퍼티
	let immutableProperty: Int = 100 // 불변 프로퍼티
	
	static var typeProperty: Int = 100 // 타입 프로퍼티
	
	// 인스턴스 메서드
	func instanceMethod() {
		print(“instance method”)
	}

	// 타입 메서드 
	// 재정의 불가 타입 메서드 - static
	static func typeMethod() {
		print(“type method - static”)
	}
	// 재정의 가능 타입 메서드 - class 	
	class func typeMethod() {
		print(“type method - static”)
	}
}
```
클래스 사용   
```
Var mutableReference: Sample = Sample() 
mutableReference.mutableProperty = 200
mutableReference.immutableProperty = 200 // 불변 프로퍼티임으로 오류

// 불변 인스턴스
Let immutableReference: Sample = Sample()
immutableReference.mutableProperty = 200 
immutableReference.immutableProperty = 200 // 불변 프로퍼티임으로 오류
```
   
   
## 열거형 enum
Enum 이름 {   
	case 이름1   
	case 이름2   
	case 이름3   
}   
   
스위프트에서는 각각의 케이스가 고유의 값으로 취급된다.   
   
```
Enum Weekday {
	case mon
	case tue
	case wed
	case thu, fri, sat, sun // 한줄씩 혹은 한줄에 전부도 가능
}

Var day: Weekday = Weekday.mon // 타입 명시
Day = .tue // 이처럼 축약도 가능

print(day)

Switch day {
Case .mon, .tue, .wed, .thu:
	print(“평일’)
Case Weekday,fri:
	print(“불금”)
Case .sat, .sun:
	print(“주말”)
} // 월~일 까지 전부 구현한다면 default는 딱히 안써도됨.
```
   
## 값 타입과 참조 타입 value type/reference type   
클래스 = 단일상속, 참조타입, 애플 프레임워크의 대부분의 큰 뼈대는 클래스로 구성   
구조체 = 상속불가, 값타입, Swift의 대부분의 큰 뼈대는 구조체로 구성   
열거형 = 상속불가, 값타입, 열거형 자체가 데이터 타입, case하나하나가 유의미한 값으로 취급   
   
구조체는 언제 사용하나   
연관된 값들을 모아서 표현하고 싶을 때   
참조가 아닌 복사를 원할 때   
상속을 받을 필요가 없을 때   
   
Value vs Reference   
Value = 데이터를 전달할 때 값을 복사하여 전달   
Reference = 데이터를 전달할 때 값의 메모리 위치를 전달   
   
```
Struct valueType {
	var property = 1
}

Class ReferenceType {
	var property = 1
}

Let firstStructInstance = ValueType()
Var secondStructInstance = firstStructInstance // 값이 그대로 복사되어 선언
secondStructInstance.property = 2

print(“first struct instance property : \(firstStructInstance.property)”) // 1
print(“second struct instance property : \(secondStructInstance.property)”) // 2

Let firstClassReference = ReferenceType()
Var secondClassReference = firstClassReference
secondClassReference.property = 2

print(“first class reference property : \(firstClassInstance.property)”) // 2
print(“second class reference property : \(secondClassInstance.property)”) // 2
// 두 값 모두 같은 값을 가르키기 때문에 전부 2
```
   
스위프트는 구조체, 열거형 사용을 선호   
Apple 프레임워크는 대부분 클래스 사용   
   
   
## 클로저 closure   
코드의 블럭   
일급 시민   
변수, 상수 등으로 저장, 전달인자로 전달이 가능   
즉 함수는 이름이 있는 클로저   
   
{ (매개변수 목록) -> 반환타입 in    
	실행 코드   
}   
   
```
// 함수 사용
Func sumFunction(a: Int, b : Int) -> Int {
	return a + b

}
Var sumResult: Int = sumFunction(a: 1, b: 2)

Print(sumResult) // 3
```

클로저의 사용
```
Var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
	return a + b
}

sumResult = sum(1,2)
print(sumResult) // 3

Sum = sumFunction(a: b:) // 함수는 클로저의 일종이므로 sum변수에 당연히 함수 할당 가능
sumResult = sum(1, 2)
print(sumResult) // 3
```
   
클로저는 주로 함수의 전달인자로서 사용된다.   
   
   
## 클로저 고급 advanced closure
생략되는 과정   
```
Result = calculate(a: 10, b: 10, method: { ( left: Int, right: Int) in
	return left + right
})
```
-> 후행클로저와 함께 사용   
```
Result = calculate(a: 10, b: 10) { ( left: Int, right: Int) in
	return left + right
}
```
-> 단축 인자 이름(매개변수 순서대로 $0, $1)   
```
Result = calculate(a: 10, b: 10, method: {
	return $0 + $1
} )
```
-> 암시적 반환 표현   
```
Result = calculate(a: 10, b: 10) {
	$0 + $1
}
```
-> 한줄 표현   
```
Result = calculate(a: 10, b: 10) { $0 + $1 }
```
   
   
## 프로퍼티 property
타입과 연관된 값을 표현할 때 사용   
저장, 연산, 인스턴스, 타입 프로퍼티가 존재   

```
Struct Student {
	// 인스턴스 저장 프로퍼티
	var name: String = “ “
	var ‘class’ : String = “Swift”
	var koreanAge : Int = 0

	// 인스턴스 연산 프로퍼티
	var westernAge: Int {
		get {
			return koreanAge -1
		}
		set(inputValue) {			// inputValue라고 명시해주지 않으면 자동으로 newValue로 선언
			koreanAge = inputValue + 1
		}
	}

	// 타입 저장 프로퍼티
	static var typeDescription: String = “학생”
 
	// 읽기전용 인스턴스 연산 프로퍼티 (get만 사용)
	var selfIntroduction: String {
		get {
			return “저는 \(self.class)반 \(name) 입니다”
		}
	}

	// 읽기전용 타입 연산 프로퍼티
	static var selfIntroduction: String {
		return “학생타입입니다.”
	}
}
```
   
호출   
```
print(Student.selfIntroduction) 	// 학생타입입니다.

Var test: Student = Student()	// 인스턴스 생성
test.koreanAge = 10			// 10 대입
	
test.name = “asdf”
print(test.name) 				// asdf 출력

print(test.selfIntroduction)		// 저는 Swift반 asdf입니다.
print(“제 한국나이는 \(test.koreanAge) 살이고, 미국나이는 \(test.werternAge) 살입니다. “)
// 제 한국나이는 10살이고, 미국나이는 9살입니다.
```
   
   
## 프로퍼티 감시자 property observer
프로퍼티 감시자를 사용하면 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있습니다.   
   
```
// 선언(willSet, didSet)
Sturct Money {
	// 프로퍼티 감시자 사용
	var currencyRate: Double = 1100 {
		wilSet(newRate) {
			print(“ 환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.”)
		}
		didSet(oldRate) {
			print(“ 환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다.”)
		}
	}

	// 프로퍼티 감시자 사용
	var dollar: Double = 0 {
		//willSet의 암시적 매개변수 이름 newValue
		willSet {
			print(“\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다”)
		}
		//didSet의 암시적 매개변수 이름 oldValue
		didSet {
			print(“\(oldValue)달러에서 \(dollar)달러로 변경되었습니다.”)
		}
	}
	// 연산 프로퍼티
	var won: Double {
		get {
			return dollar * currencyRate
		}
		set {
			dollar = newValue / currencyRate
		}
	}
}
```
   
사용   
```
Var moneyInMyPocket: Money = Money()

// 환율이 1100.0 에서 1150.0으로 변경될 예정입니다.
moneyInMyPocket.currencyRate = 1150
// 환율이 1100.0 에서 1150.0 으로 변경되었습니다.

// 0.0 달러에서 10.0 달러로 변경될 예정입니다.
moneyInMyPocket.dollar = 10
// 0.0 달러에서 10.0 달러로 변경되었습니다.

print(moneyInMyPocket.won)
// 11500.0 출력
```
   
   
## 상속 inheritance
클래스, 프로토콜 에서 가능   
열거형, 구조체 상속이 불가   
Swift는 다중상속을 지원하지 않는다   
   
// 구조   
Class 이름 : 상속받을 클래스 이름 {   
	구현부   
}   
   
```
Class Person {
	var name: String = “ “
	func selfIntroduce() {
		print(“저는 \(name) “)
	}

	// final 키워드를 사용하여 재정의 방지
	final func sayHello() {
		print(“Hello”)
	}
	
	// 재정의 불가 메서드 static
	static func typeMethod() {
		print(“static”) 
	}
	
	// 재정의 가능 메서드
	class func classMethod() {
		print(“class”) 
	}
}

	// 재정의가능한 class메서드라도 final 키워드 사용가능 -> static과 같은 동작
```
   
실행   
```
Class Student: Person {
	var name: String = “ “ // -> 위에서 상속받았기 때문에 오류
	var major: String = “ “
	
	// 덮어 쓰고 싶다면 override 사용 
	override func selfIntroduce() {
		print(“저는 \(name)이고, 전공은 \(major)입니다.”)
		super.selfIntroduce() // 부모클래스의 selfIntroduce 호출
	}

	override class func classMethod() {
		print(“ class 메서드는 재정의 가능”)
	}
	 
	// static 메서드는 재정의 불가
	// final 과 final class 또한 재정의 불가
}

Let test1: Person = Person()
Let test2: Student = Student()

Test1.name = “asdf”
Test2.name = “zxcv”
Test2.major = “Swift”

Test1.selfIntroduce() // 저는 asdf
Test2.selfIntroduce() // 저는 zxcv이고 전공은 Swift입니다.

Person.classMethod() // class
Person.typeMethod() // static

Student.classMethod() // class 메서드는 재정의 가능
// 나머지 재정의 불가.
```


