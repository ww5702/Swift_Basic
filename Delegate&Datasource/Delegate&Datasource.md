# Delegete, Datasource
<img width="719" alt="스크린샷 2022-12-13 오후 3 42 53" src="https://user-images.githubusercontent.com/60501045/207245534-b39bfa85-3689-43af-900f-f08136aa8fbe.png">
   
   
   
## Delegate
Delegate는 '위임하다'라는 사전적 의미를 갖고 있다.   
즉 위임자라고 생각하는것이 편하다.   
   
Delegate는 객체 지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아닌   
처리해야할 일중 일부를 다른 객체에 넘기는것을 뜻한다.   
   
   
TableView Delegate 객체는 UITableViewDelegate 프로토콜을 채택한다.   
TableView의 시각적인 부분 수정, 행의 선택관리, 액서세리뷰 지원, 개별 행 편집을 도와준다.   
테이블뷰의 세세한 부분을 조정할 수 있다.   
주요 메서드는 다음과 같다.(Datasource와는 다르게 필수로 구현해야 하는 메서드는 없다.)   
```
// 특정 위치 행의 높이를 묻는 메서드
 func tableView(UITableView, heightForRowAt: IndexPath)
 // 특정 위치 행의 들여쓰기 수준을 묻는 메서드
 func tableView(UITableView, indentationLevelForRowAt: IndexPath)

 // 지정된 행이 선택되었음을 알리는 메서드
 func tableView(UITableView, didSelectRowAt: IndexPath)

 // 지정된 행의 선택이 해제되었음을 알리는 메서드
 func tableView(UITableView, didDeselectRowAt: IndexPath)

 // 특정 섹션의 헤더뷰 또는 푸터뷰를 요청하는 메서드
 func tableView(UITableView, viewForHeaderInSection: Int)
 func tableView(UITableView, viewForFooterInSection: Int)

 // 특정 섹션의 헤더뷰 또는 푸터뷰의 높이를 물어보는 메서드
 func tableView(UITableView, heightForHeaderInSection: Int)
 func tableView(UITableView, heightForFooterInSection: Int)

 // 테이블뷰가 편집모드에 들어갔음을 알리는 메서드
 func tableView(UITableView, willBeginEditingRowAt: IndexPath)

 // 테이블뷰가 편집모드에서 빠져나왔음을 알리는 메서드
 func tableView(UITableView, didEndEditingRowAt: IndexPath?)
```
   

## Datasource 
Datasource는 데이터 모델의 Delegate로 테이블 뷰의 시각적 모양에 대한 최소한의 정보를 제공한다.  
Delegate와 비슷하게 저리 해야 할 일 중 일부를 다른 객체에 넘겨서 작업을 대신해주는 역할을 한다.   
   
   
TableView Datasource 객체는 UITableViewDataSource프로토콜을 채택한다   
ex) class ViewController: UITasbleViewDataSource   
앞서 말했듯이 데이터소스는 테이블 뷰를 생성하고 수정하는데 필요한 정보를 제공한다.   
TableView 객체에 섹션의 수와 행의 수를 알려주며, 행의 삽입, 삭제 및 정렬 기능을 구현.   
주요 메서드는 다음과 같다.   
```
@required 
 // 특정 위치에 표시할 셀을 요청하는 메서드
 func tableView(UITableView, cellForRowAt: IndexPath) 
 
 // 각 섹션에 표시할 행의 개수를 묻는 메서드
 func tableView(UITableView, numberOfRowsInSection: Int)
 
 @optional
 // 테이블뷰의 총 섹션 개수를 묻는 메서드
 func numberOfSections(in: UITableView)
 
 // 특정 섹션의 헤더 혹은 푸터 타이틀을 묻는 메서드
 func tableView(UITableView, titleForHeaderInSection: Int)
 func tableView(UITableView, titleForFooterInSection: Int)
 
 // 특정 위치의 행을 삭제 또는 추가 요청하는 메서드
 func tableView(UITableView, commit: UITableViewCellEditingStyle, forRowAt: IndexPath)
 
 // 특정 위치의 행이 편집 가능한지 묻는 메서드
 func tableView(UITableView, canEditRowAt: IndexPath)

 // 특정 위치의 행을 재정렬 할 수 있는지 묻는 메서드
 func tableView(UITableView, canMoveRowAt: IndexPath)
 
 // 특정 위치의 행을 다른 위치로 옮기는 메서드
 func tableView(UITableView, moveRowAt: IndexPath, to: IndexPath)
```

***
Delegate는 어떤 행동에 대한 "동작"을 제시하고, Datasource는 '보여주는'것들을 담당한다.   
