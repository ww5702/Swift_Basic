애플문서에도 나와있지만 swift에서 추론은 아주 강력하며, 코드의 양을 줄여준다.   
하지만 추론을 이해하지 못한다면 코드의 가독성은 현저히 떨어진다.   
   
클로저와 가변 인자로 인자를 가지는 함수 코드이다.   
```
func sumOfSquare(closure: (Double -> Double), numbers: Double...) -> Double {
    var result: Double = Double()
    for number in numbers {
        result += closure(number)
    }
    return result
}
```
위 함수는 가변 인자들의 값을 클로저를 통한 값들로 모두 합치는 역할을 한다.   
다음은 클로저에 넣을 함수 정의 코드이다   
```
func square(value: Double) -> Double {
    return value * value
}
```
두 함수를 이용하여 이와 같이 표현할 수 있다.   
```
sumOfSquare(square, 1,2,3,4,5)
// 55.0
```
함수를 인자에 할당하였기 때문에 추론을 사용하지 않습니다.   
그렇다면 추론을 통해 클로저를 작성한다면   
위의 square함수 역할을 하는 클로저를 만들어 인자에 할당하도록 한다.   
```
sumOfSquare( {(value: Double) -> Double in return value * value}, 1,2,3,4,5 )
```
아직은 추론으로 코드를 줄이지 않았다.   
위 클로저에서 반환타입 Double은 value 값의 타입을 통해 타입이 추론되므로 생략가능   
```
sumOfSquare( {(value: Double) in return value * value}, 1,2,3,4,5 )
```
클로저에서 항상 in 뒤에는 return 값이 나오므로 추정해서 생략가능   
```
sumOfSquare( {(value:Double) in value * value}, 1,2,3,4,5 )
```
클로저의 value값의 타입은 sumOfSquare 함수에 정의되어 있기에 생략 가능.   
```
sumOfSquare( { value in value * value }, 1,2,3,4,5)
```
클로저의 value는 중복해서 쓰이기 때문에 인자로 들어온 순서대로 $0을 통해 사용할 수 있다.   
따라서 값을 어떻게 반환할지만 정하고 생략 가능   
```
sumOfSquare( { $0 * $0 }, 1,2,3,4,5)
```
