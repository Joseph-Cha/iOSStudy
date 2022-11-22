//
//  ViewController.swift
//  Settings_Clone_App
//
//  Created by 차동훈 on 2022/11/19.
//

import UIKit

// 화면의 UI를 표시, 화면 이동을 관리함
class ViewController: UIViewController {
    
    // [[]]: 2차원 배열
    var settingModel = [[SettingModel]]()
    

    
    @IBOutlet weak var settingTableView: UITableView!

    func makeData() {
        settingModel.append(
            [SettingModel(leftImageName: "person.circle", menuIttile: "Sign in to your iPhone", subTitle: "Set up iCoud, the App Store, and more", rightImageName: nil)]
        )
        
        settingModel.append(
            [SettingModel(leftImageName: "gear", menuIttile: "General", subTitle: nil, rightImageName: "chevron.right"),
            SettingModel(leftImageName: "person.fill", menuIttile: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
            SettingModel(leftImageName: "hand.raised.fill", menuIttile: "Privacy", subTitle: nil, rightImageName: "chevron.right")]
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        // ProfileViewCell에서 설정된 ID 값을 토대로 가지고 옴.
        settingTableView.register(UINib(nibName: "ProfileViewCell", bundle: nil), forCellReuseIdentifier: "ProfileViewCell")
        settingTableView.register(UINib(nibName: "MenuViewCell", bundle: nil), forCellReuseIdentifier: "MenuViewCell")
        
        makeData()
    }
}

// table view를 구성하는 기본적인 protocol 구현 방법
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 세션의 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    // 현재 세션이 몇 개의 열을 가지고 있는지 결정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 현재 세션의 갯수만큼 셀이 출력 될 수 있도록
        return settingModel[section].count
    }
    
    // 현재 테이블에서 선택된 열(cell) 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewCell", for: indexPath) as! ProfileViewCell
            
            // indexPath.section: 현재 세션 번호
            // indexPath.row: 현재 세션에서 열의 번호
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuIttile
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuViewCell", for: indexPath) as! MenuViewCell
        
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImageView.tintColor = .red
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuIttile
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
        
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
