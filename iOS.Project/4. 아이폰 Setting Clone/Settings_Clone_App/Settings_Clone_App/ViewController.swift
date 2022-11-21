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
        
        // ProfileViewCell에서 설정된 ID 값을 토대로 가지고 옴.
        settingTableView.register(UINib(nibName: "ProfileViewCell", bundle: nil), forCellReuseIdentifier: "ProfileViewCell")
        
        settingTableView.register(UINib(nibName: "MenuViewCell", bundle: nil), forCellReuseIdentifier: "MenuViewCell")
        
        
    }
}

// table view를 구성하는 기본적인 protocol 구현 방법
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // 현재 테이블이 몇개의 열을 가지고 있는지 결정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // 현재 테이블에서 선택된 열(cell) 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewCell", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuViewCell", for: indexPath)
        
        return cell
    }
    
    // 테이블의 셀 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // 첫 번째 열은 해당 Cell의 높이 만큼으로 자동으로 설정해 준다.
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        // 나머지는 60
        return 60
    }
    
}
