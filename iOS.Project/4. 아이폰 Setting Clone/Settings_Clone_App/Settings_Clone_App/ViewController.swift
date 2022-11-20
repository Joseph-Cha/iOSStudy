//
//  ViewController.swift
//  Settings_Clone_App
//
//  Created by 차동훈 on 2022/11/19.
//

import UIKit

// 화면의 UI를 표시, 화면 이동을 관리함
class ViewController: UIViewController {


    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        let nib = UINib(nibName: "ProfileCell", bundle: nil)
        settingTableView.register(nib, forCellReuseIdentifier: "ProfileCell")
        
        
    }


}

// table view를 구성하는 기본적인 protocol 구현 방법
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // 현재 테이블이 몇개의 열을 가지고 있는지 결정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 현재 테이블에서 선택된 열(cell) 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        return cell
    }
    
    // 테이블의 셀 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
