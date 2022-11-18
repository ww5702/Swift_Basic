# Swift 기본 문법 3
   
옵셔널 값 추출, 구조체, 클래스, 열거형, 값 타입 & 참조 타입, 클로저, 프로퍼티, 상속

## 인스턴스의 생성과 소멸 init, deinit
   
모든 프로퍼티에 유효한 값이 할당되어 있어야 한다   
프로퍼티는 무조건 초기화되어있어야한다   
이니셜라이저를 사용하면 초기화와 동시에 값을 할당할 수 있다.   
```
Class PersonB {
	var name: String
	var age: Int
	var nickName: String

	// 이니셜라이저
	init(name: String, age: Int, nickName: String) {
		self.name = name
		self.age = age
		self.nickName = nickName
	}
}	

Let asdf: PersonB = PersonB(name: “asdf”, ag: 20, nickName: “asdf2”)
asdf.name = “asdf” // 이런식보다는 위에 줄이 훨씬 간편하다는 소리
```
   
하지만 만약에 nickName이 없는 즉 값을 할당 할 수 없는 상태라면 옵셔널 사용   
``` 
Class PersonC {
	var name: String
	var age: Int
	var nickName: String? 	// 이 프로퍼티가 꼭 필요한것은 아니다 -> 옵셔널 적용 

	// 이니셜라이저
	init(name: String, age: Int, nickName: String) {
		self.name = name
		self.age = age
		self.nickName = nickName
	}
}	

Let Jenny: PersonC = PersonC(name: “Jenny”, age: 10)
Let mike: PersonC = PersonC(name: “mike”, age: 15, nickName: “m”)
```
   
암시적 추출 옵셔널 (! 사용) 프로퍼티가 꼭 필요한 경우에 사용   

Var owner: PerconC!

// 실패 가능한 이니셜라이저 -> 전달되는 값들이 정상 범주를 넘어가거나 실패가능성이 있다면
// nil을 반환할 수 있도록

Class PersonD {
	var name: String
	var age: Int
	var nickName: String? 	// 이 프로퍼티가 꼭 필요한것은 아니다 -> 옵셔널 적용 

	// 이니셜라이저
	init? (name: String, age: Int) {			// exception 처리
		if(0…120).contains(age) == false {
			return nil
		}
		if name.characters.count == 0 {
			return nil
		}
		self.name = name
		self.age = age
	}
}

Let John: PersonD? = PersonD(name: “John”, age: 23) 		// ?(옵셔녈)을 붙이지 않는다면 오류
Let John2: PersonD? = PersonD(name: “John”, age: 123) 		
Let John3: PersonD? = PersonD(name: “”, age: 23) 			

print(John2) // 오류 nil 출력
print(John3) // 오류 nil 출력

// 디이니셜라이저
// 인스턴스가 해제되는 시점에 해야할 일을 구현

Class PersonE {
	var name: String
	var per: Puppy?’
	var child: PersonC

	// 이니셜라이저
	init(name: String, child: PersonC) {
		self.name = name
		self.child = child
	}

	// 디이니셜라이저
	deinit {
		if let petName = pet?.name {
			print(“\(name)가 \(child.name)에게 \(petName)을 인도합니다”)
			self.pet?.owner = child
		}
	}
}

Var Donald: PersonE? = PersonE(name:”Donald”, child Jenny)
Donald?.pet = happy
Donald = nil // Donald 인스턴스가 더이상 필요없으므로 메모리에서 해제
// donald가 jenny에게 happy를 인도합니다 출력


옵셔널 체이닝과 nil 병합 연산자
Optional chaining & nil-coalescing operatior

옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로 옵셔널이 연속적으로 연결되는 경우 사용

Class Person {
	var name: String
	var job: String?
	var home: Apartment?
	init(name: String) {
		self.name = name
	}
}

Class Apartment {
	var buildingNumber: String
	var roomNumber: String
	var ‘guard’: Person?
	var owner: Person?

	init(dong:String, ho:String) {
		buildingNumber = dong
		roomNumber = ho
	}

Let a: Person? = Person(name:” a “)
Let apart: Apartment? = Apartment(dong: “101”, ho: “202”)
Let b: Person? = Person(name:” b “)
// 필수적으로 가져야할 프로퍼티만 가진 상태

// 만약 경비원의 직업이 궁금하다면?
// 셔널 체이닝을 사용하지 않는 경우
Func guardJob (owner: Person?) {
	if let owner = owner {
		if let home = owner.home {
			if let ‘guard’ = home.guard {
				if let guardJob = ‘guard’.job {
					print(“ 직업은 \(guardjob)입니다. “)
				} else {
					print(“ 직업이 없어요. “)
				}
			}
		}
	}
} 

//옵셔널 체이닝을 사용
Func guardJob (owner: Person?) {	// 사람이 있는지 없는지 확인
	if let guardJob = owner?.home?.guard?.job {
		print(“ 직업은 \(guardjob)입니다. “)
	} else {
		print(“ 직업이 없어요. “)
	}
}
guardJob(owner: a) // 직업이 없어요 출력됨

// 예시
A?.home?.guard?.job			// nil
A?.home = apart				// a의 집을 선언했던 apart로 지정

A?.home 					// Optional(Apartment)
A?.home?.guard				// 여전히 없음 nil

A?.home?.guard = b			// a집의 경비원을 b로 지정
A?.home?.guard?.name 		// b 출력됨
A?.home?.guard?.job			// b의 직업은 없으므로 nil 출력

A?.home?.guard?.job = “경비원’	// b의 직업을 경비원으로 지정

// nil 병합 연산자
Var guardJob: String
guardJob = a?.home?.guard?.job ?? “슈퍼맨” 		// ?? 앞의 값이 nil이라면 그 nil의 값을 뒤의 “ “ 내용의 값으로 입력
print(guardJob)							// 이미 경비원이라는 직업이 있었으므로 경비원 출력
A?.home?.guard?.job = nil					// 다시 nil로 초기화

guardJob = a?.home?.guard?.job ?? “슈퍼맨” 		// ?? 앞의 값이 nil이라면 그 nil의 값을 뒤의 “ “ 내용의 값으로 입력
print(guardJob)							// 직업이 nil로 초기화됐으므로 슈퍼맨 출력됨


타입캐스팅	type casting

타입캐스팅은 인스턴스의 타입을 확인하는 용도
클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 상용할 수 있는지 확인하는 용도
Is, as를 사용

Let someInt: Int = 100
Let someDouble: Double = Double(someInt) // 이것은 타입캐스팅이 아니다

Class person {
	var name: String= “ “
	func breath() {
		print( “ 숨을 쉽니다 “ )
	}
}
// 사람을 상속받은 학생 클래스
Class Student: Person {
	var school: String = “ “
	func goToSchool() {
		print(“ 등교를 합니다”)
	}
}
//학생을 상속받은 대학교학생 클래스
Class UniversityStudent: Student {
	var major: String = “ “
	func goToMT() {
		print(“ 멤버쉽 트레이닝을 갑니다. “)
	}
}

Var a: Person = Person()
Var b: Student = Student()
Var c: UniversityStudent = UniversityStudent()

// 타입확인

Var result: Bool
Result = a is Person			 // true
Result = a is Student 			// false
Result = a is UniversityStudent	 // false

Result = b is Person			 // true
Result = b is Student 			// true
Result = b is UniversityStudent 	// false

Result = c is Person			 // true
Result = c is Student			// true
Result = c is UniversityStudent 	// true

If a is UniversityStudent {
	print(“a 는 대학생입니다. “) 
}else if a is Student {
	print(“a 는 학생입니다. “)
}else if a is Person {
	print(“a 는 사람입니다. “)
} // a는 사람입니다 출력
// switch문도 똑같이 사용가능

업캐스팅
as를 사용하여 부모클래스의 인스턴스로 사용할 수있도록 컴파일러에게 타입정보를 전달해준다
많이 사용되지는 않는다

Var d.Person = UniversityStudent() as Person // d도 대학생이지만 사람이기도 하다
Var e: Student = Student()
Var f: Any = Person() // as Any 생략 가능

다운캐스팅
as? 와 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 인스턴스의 타입정보 전환
 

조건부 다운 캐스팅 as?

Var optionalCasted : Student?
// 사람타입으로 지정이 되어있는데 얘가 실질적으로 학생일 수 있느냐 라는 경우

optionalCasted = d as? UniversityStudent 		// d는 실질적으로 대학생으로 되어있기 때문에 가능
optionalCasted = e as? UniversityStudent 		// nil
optionalCasted = f as? UniversityStudent 		// nil
optionalCasted = f as? Student 				// nil


강제 다운 캐스팅 as!

Var forcedCasted: Student
// 넌 강제로 이거 해야해 라는 경우

optionalCasted = d as! UniversityStudent		// 원래 대학생이었기에 가능
optionalCasted = e as! UniversityStudent 		// 런타임 오류
optionalCasted = f as! UniversityStudent 		// 런타임 오류
optionalCasted = f as! Student 				// 런타입 오류


Assert와 guard.  Assertion, early exit

애플리케이션이 동작 도중에 생성하는 다양한 결과값을 동적으로 확인하고 안전하게 처리할 수있도록 도와줌

Assertion
디버깅 중 조건의 검증을 위하여 사용
예상했던 조건이 확실히 맞는가를 검증하기 위해 자주 사용

Var someInt: Int = 0
assert(someInt == 0, “someInt != 0”)	// someInt가 0이 맞으면 자연스럽게 지나가고, 0이 아니면 메세지 출력 후 동작정지


Early exit
guard를 사용하여 잘못된 값의 전달 시 빠르게 종료
디버깅뿐만 아니라 어떤 조건에서도 동작
guard의 else 블럭 내부에는 코드를 종료하는 (return, break)이 반드시 존재하여야 한다

Func functionWithGuard(age: Int?) {
	guard let unwrappedAge = age,
		unwrappedAge < 130,
		unwrappedAge >= 0 else {
		print(“ 나이값 입력이 잘못되었습니다. “)
		return 
	}
	print(“ 당신의 나이는 \(unwrappedAge)세 입니다.”)
}

딕셔너리에서 많이 사용된다
Guard let age = info[“age”] as? Int else {
	return
} 
someFunction(info: [“age” : “10”] 		// age값이 String값이었기 때문에 자동으로 종료된다.



프로토콜 protocol

특정 역할을 수행하기 위한 메서드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의
즉 어떤 타입(구조체, 클래스)에 이 기능이 꼭 필요해 그러니 이 기능을 꼭 구현해 놨어야해 라고 강요하는 것
그 후 타입에서 채택(Adopted)해서 구현하고
프로토콜의 요구사항을 모두 따른다면 ‘프로토콜을 준수한다(Conform)’ 이라고 표현한다

Protocol 프로토콜 이름 {
	정의부
}

Protocol Talkable {
	// 프로퍼티 요구
	var topic: String { get set }
	var language: String { get }

	// 메서드 요구
	func talk()

	// 이니셜라이저 요구
	init(topic: String, language: String)

} // Talkable이라는 프로토콜은 어떤 특정한 타입에 채택이 되었을 때 그 타입은 위의 프로퍼티 메서드 이니셜라이저를 꼭 구현해야 한다. 

Struct Person: Talkable {
}
-> 구조체가 Talkable이라는 프로토콜을 채택했다.
-> 따라서 위의 프로퍼티 메서드 이니셜라이저를 구현해야한다.

프로토콜은 상속을 받을 수도 있다
Protocol 프로토콜 이름 : 부모 프로토콜 이름 목록 {
	정의부
}
Protocol Readable {
	func read()
}
Protocol Writeable {
	func write()
}
Protocol ReadSpeakable: Readable {
	func speak() 
} // 이 프로토콜은 이미 Readable 프로토콜을 상속 받았기 때문에 read() 기능도 똑같이 필요하다


클래스 상속과 프로토콜
클래스 상속과 프로토콜 채택을 동시에 하려면
상속받으려는 클래스를 먼저 명시하고, 그 뒤에 채택할 프로토콜 목록을 작성한다
Class SubClass: SuperClass, Writeable, RedSpeakable {
}

인스턴스가 특정 프로토콜을 준수하는지 is, as연산자를 통해 확인할 수 있다
Var someAny: Any = sup
someAny is Readable()
someAny is ReadSpeakable() 


익스텐션 extension
구조체, 클래스 등 여러 타입에 새로운 기능을 추가할 수 있는 기능
연산 타입 프로퍼티나 타입메서드 이니셜라이저 등등을 추가 가능

Extension 확장할 타입 이름 {
	타입에 추가될 새로운 기능 구현
}

추가적으로 다른 프로토콜을 채택할 수 있도록 확장도 가능
Extension 확장할 타입 이름 : 프로토콜1, 프로토콜2, … {
	프로토콜 요구사항 구현
}

Extension Int {
	var isEven: Bool {
		return self % 2 == 0
	}
	var isOdd: Bool {
		return self % 2 == 1
	}
}

print(1.isEven) // false
print(2.isEven) // true
// 위와 같이 Int에 짝수인지 홀수인지 확인할 수 있는 기능 구현
Var number: Int = 3
print(number.isEven) // false
// 선언 후 사용도 가능


메서드 추가
Extension Int {
	func multiply(by n: Int) -> Int {
		return self * n
	}
}

print(3.multiply(by: 2)) // 6
print(4.multiply(by: 3)) // 12


이니셜라이저 추가
Extension String {
	init(intTypeNumber: Int) {
		self = “\(intTypeNumber)”
	}
}
Let stringFromInt: String = String(intTypeNumber: 100)		// Int 100을 String “100” 으로 변환


오류처리 error handling
error프로토콜과 열거형을 통해서 오류를 표현한다

Enum 오류종류이름: Error {
	case 종류1
	case 종류2
	…
}

// 자판기 동작 오류 종류를 표현한 열거형
Enum VendingMachineError: Error {
	case invalidInput
	case insufficientFunds(moneyNeeded: Int)
	case outOfStock
}

// 오류 발생의 여지가 있는 메서드라면 thorws를 사용하여 오류의 가능성을 내포한다.
Class vendingMachine {
	let itemPrice: Int = 100
	var itenCount: Int = 5
	var deposited: Int = 0

	// 돈 받기	
	func receiveMoney(_ money: Int) throws {
		// 입력한 돈이 0 이하면 오류 던짐
		give money > 0 else {
			throw VendingMachineError.invalidInput
		}
		// 오류 없으면 정상처리
		self.deposited += money
		print(“\(money)원 받음”)
	}

	//물건 팔기 메서드
	func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
		// 원하는 아이템의 수량이 잘못 입력되어있으면 오류 던짐
		guard numberOfItemsToVend > 0 else {
			throw VendingMachineError.invalidInput
		}

		// 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류 던짐
		guard numberOfItemsToVend * itemPrice <= deposited else {
			throw VendingMachineError.insufficientFunds(moneyNeeded: money)
		}
		// 등등의 오류
}

오류발생의 여지가 있는 throws 함수는 try를 사용하여 호출해야 한다
Try, try!, try? 으로 사용

Try는 do-catch
Try?는 오류가 발생했으면 nil로 돌려받고, 정상동작한다면 정상반환값을 받는다
Try!는 오류가 발생하지 않을거라는 확신을 가질때 사용, 오류 발생시 런타임 오류



고차함수 higher-order function

전달인자로 함수를 받거나 함수실행의 결과를 함수로 변환
Map, filter, reduce

Map
기존 데이터를 변형하여 새로운 컨테이너 생성
Let numbers: [Int] = [0,1,2,3,4]
Var doubledNumbers: [Int]
Var Strings = [String]

// 2배로 변환
doubledNumbers = numbers.map( { (number: Int) -> Int in
	return number * 2
} )

// 문자열로 변환
Strings = numbers.map( { (number: Int) -> String in
	return “\(number)”
} )

print(doubledNumbers) // [0,2,4,6,8]
print(Strings) // [“0”,”1”,”2”,”3”,”4”]

// 전부 생략하여 깔끔하게 2배 문구
doubledNumbers = numbers.map{ $0 * 2 }


Filter
내부의 값을 걸러서 새로운 컨테이너로 추출

Var filtered: [Int] = [Int]()

// 짝수인 친구들만 필터링
For number in numbers {
	if number % 2 == 0 {
		filtered.append(number)
	}
}
print(filtered) // [0,2,4]

// 생략 야무지게
Let oddNumbers: [Int] = numbers.filter {
	$0 % 2 != 0
}


Reduce 	
내부의 콘텐츠를 하나로 통합

Let someNumbers: [Int] = [2,8,15]

// 초기값이 0이고 someNumbers 내부의 모든 값을 더합니다.
Let sum: Int = someNumbers.reduce(0, {
	(first: Int, second: Int) -> Int in
	return first  second
})
print(sum) 		// 25
 
// 초기값이 3이고 someNumbers 내부의 모든 값을 더합니다
Let sumFromThree = someNumbers.reduce(3) { $0 + $1 }
print(sumFromThree)		 // 28
