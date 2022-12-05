//
//  ViewController.swift
//  OnBoardingViewApp
//
//  Created by 차동훈 on 2022/12/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // viewDidLoad가 아니라 viewDidAppear에서 view를 띄우는 이유:
    // viewDidLoad의 경우 아직 화면이 그려지지 않은 상태이기 때문에(단순히 메모리에 올라간 순간이다)
    // 아래 present를 하게 될 경우 계층에러가 발생하게 된다.
    // 반면 viewDidAppear의 경우는 화면이 그려진 다음 호출되기 때문에 정상적으로 동작하게 된다.
    // 따라서 화면에 그려지는 동작을 구현할 때는 이렇게 화면이 보여진 이후에 동작을 해야 문제가 발생하지 않는다.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        pageVC.modalPresentationStyle = .fullScreen
        
        self.present(pageVC, animated: true, completion: nil)
    }


}

