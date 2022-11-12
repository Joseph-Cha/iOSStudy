// passing data (데이터를 넘겨주는 방법)
// 6가지

// 1. instance property
// 2. segue -> 하나의 스토리 보드에 여러 ViewController가 있을 때 사용
// 3. instance을 통으로 넘기기
// 4. delegate (delegation) pattern 대리 위임 대신

import UIKit

class ViewController: UIViewController {
    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dataLabel: UILabel!

    // prepare를 사용하면 연결된 segue로 이동할 때 호출이 된다.
    // 따라서 원하는 segue를 찾아서 해당 viewCotroller의 속성 값에 값을 할당할 수 있다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "adbc"
            }
        }
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
    
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        detailVC.mainVC = self
        self.present(detailVC, animated: true, completion: nil)
        
    }
    
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        
        // 나 자신을 통으로 넘기는 것이 아니라 extension으로 구현한 구현부만 넘기게 된다.
        // 즉 DelegateDetailViewControllerDelegate 타입만 넘기는 것이다.
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        detailVC.myClosure = { str in
            self.dataLabel.text = str
        }
        
        self.present(detailVC, animated: true)
    }
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
}
