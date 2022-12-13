//
//  ViewController.swift
//  TableViewTest
//
//  Created by 이재웅 on 2022/12/13.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let Datalist = ["1행", "2행", "3행", "4행"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 테이블 뷰의 총 섹션 개수를 묻는 메서드
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    // 테이블 뷰의 총 행의 개수를 묻는 메서드
    func tableView(_ tableView : UITableView, numberOfRowsInSection: Int) -> Int {
        return Datalist.count
    }
    
    // 특정 위치에 표시할 셀을 요청하는 메서드
    // indexPath에 어떤 cell이 들어갈 것인지를 설정하는 메서드
    // 따라서 반환타입이 UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableview_cell") else {
            fatalError("셀이 존재하지 않습니다.")
        }
        cell.textLabel?.text = self.Datalist[indexPath.row]
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: <#T##IndexPath#>, animated: true)
    //        let row = indexPath.row
    //        print(Datalist[row])
    //    }
}
