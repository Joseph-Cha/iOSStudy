// passing data (데이터를 넘겨주는 방법)
// 6가지

// 1. instance property

import UIKit

class ViewController: UIViewController {
    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailVC.someString = "aaa 데이터"
        
        // 화면에 올라가기 전에 접근하면 에러가 발생
        // detailVC.someLabel.text = "bb"
        
        // present를 호출해야 화면에 올라갈 준비를 하기 때문에
        // present를 하기 전에 ui 요소에 접근을 하면 nil 에러가 발생
        self.present(detailVC, animated: true, completion: nil)
        
        // 보통 이런 방식으로 ui의 속성 값을 할당하지는 않는다.
        detailVC.someLabel.text = "bb"
        
    }
    
}

