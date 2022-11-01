//
//  ViewController.swift
//  App_Start
//
//  Created by 차동훈 on 2022/11/01.

import UIKit

// 실행 -> command + R

// fileprivate: 해당 파일에서만 접근 가능
fileprivate enum SomeStype {
    case aa
}

class ViewController: UIViewController {
    
    // 이렇게 클래스 내부에 선언하면 해당 클래스에서만 사용 가능
    struct SomeStruct {
        var aaa = ""
    }
    
    // @IBOutlet -> 화면이랑 연결된 변수라는 의미
    @IBOutlet weak var testButton: UIButton!
    
    // @IBAction -> 화면이랑 연결된 기능과 연결됨
    // 즉 버튼을 클릭 했을 때 연동되는 액션
    @IBAction func doSomething(_ sender: Any) {
        // .orange가 가능한 이유는 backgroundColor 타입이 UIColor로 고정되어 있기 때문에 타입 추론이 가능해서이다.
        testButton.backgroundColor = .orange
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(identifier: "DetailViewController") as DetailViewController
        
        self.present(detailViewController, animated: true, completion: nil)
        
    }
    
    // 화면이 메모리에 올라 갔을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testButton.backgroundColor = UIColor.red
    }
}

