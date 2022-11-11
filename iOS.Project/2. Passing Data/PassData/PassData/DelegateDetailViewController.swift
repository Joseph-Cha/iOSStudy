//
//  DelegateDetailViewController.swift
//  PassData
//
//  Created by 차동훈 on 2022/11/08.
//

import UIKit

// weak 키워드를 사용하기 위해서 AnyObject를 상속받아야 한다.
protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {
    
    // weak 타입으로 하는 이유
    // 해당 delegate의 정의가 내려지는 곳이 따로 있기 때문에
    // 그쪽에서 만들고 사용하고 끝나면 메모리 해제가 될 수 있도록 하기 위함
    weak var delegate: DelegateDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func passDataToMainVC(_ sender: Any) {
        delegate?.passString(string: "pass Data")
        self.dismiss(animated: true, completion: nil)
    }
}
