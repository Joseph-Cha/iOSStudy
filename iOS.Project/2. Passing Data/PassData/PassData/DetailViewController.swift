import UIKit

class DetailViewController: UIViewController {
    
    // ViewController instance가 생성되는 시점에
    // 해당 속성 값을 할당해 주고
    // 해당 값을 ui에 할당하는 시점은 viewDidLoad() 이후
    // 즉 ui가 메모리에 올라가고 나서 할당해 주는 방식을 사용한다.
    var someString = ""
    
    // instance가 생성되는 시점에는 nil이다.
    // 단, 화면에 UI들이 올라갈 수 있도록 준비 되는 시점에 ui가 메모리에 올라간다.
    // 즉, viewDidLoad가 될 때 생성된다.
    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // super.viewDidLoad()가 호출됐을 때 someLabel이 메모리에 올라가기 때문에 접근할 때 문제가 없다.
        someLabel.text = someString
    }

}
