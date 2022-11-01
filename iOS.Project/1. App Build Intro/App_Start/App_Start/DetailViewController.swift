//
//  DetailViewController.swift
//  App_Start
//
//  Created by 차동훈 on 2022/11/01.
//

import UIKit

// UIViewController의 라이프 사이클 중요 요소
class DetailViewController: UIViewController {

    // instance 된 다음 화면에 올릴 준비가 되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 화면에 나오기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 화면에 나온 후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // 화면에 사라지기 직전
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // 화면에 사라지고 난 다음
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
