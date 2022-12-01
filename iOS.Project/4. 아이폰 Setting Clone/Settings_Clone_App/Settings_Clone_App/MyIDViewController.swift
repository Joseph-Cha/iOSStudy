import UIKit

class MyIDViewController: UIViewController {
    
    // IBOutlet: 버튼의 색상 및 각종 설정을 할 때 사용하는 방식
    // @IBAction: 버튼이 눌렸을 때 행동을 정의
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton! {
        // 처음 셋팅할 때
        didSet {
            nextButton.isEnabled = false
        }
    }
    
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // target: 실행해야할 function이 어디에 있는지 정의
        // editingChanged가 될 때마다 selector에 등록한 func에 메시지를 전달하겠다는 의미
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }

}
