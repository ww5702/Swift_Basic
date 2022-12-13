# Delegete, Datasource

## Delegate
Delegate는 '위임하다'라는 사전적 의미를 갖고 있다.   
즉 위임자라고 생각하는것이 편하다.   
   
Delegate는 객체 지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아닌   
처리해야할 일중 일부를 다른 객체에 넘기는것을 뜻한다.   
(TableView의 시각적인 부분 수정, 행의 선택관리, 액서세리뷰 지원, 개별 행 편집을 도와준다.)   
   

## Datasource 
Datasource는 데이터 모델의 Delegate로 테이블 뷰의 시각적 모양에 대한 최소한의 정보를 제공한다.  
Delegate와 비슷하게 저리 해야 할 일 중 일부를 다른 객체에 넘겨서 작업을 대신해주는 역할을 한다.   
(TableView 객체에 섹션의 수와 행의 수를 알려주며, 행의 삽입, 삭제 및 정렬 기능을 구현.)  
   
   
TableView 데이터 소스 객체는 UITableViewDataSource프로토콜을 채택한다   
ex) class ViewController: UITasbleViewDataSource   
앞서 말했듯이 데이터소스는 테이블 뷰를 생성하고 수정하는데 필요한 정보를 제공한다.   
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
