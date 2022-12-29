# iOSStudy
iOS 앱 개발 개인 스터디 공간입니다.

## 1. App Build Intro

<img src="./resources/1.AppBuildIntro.gif" width="30%" height="30%"/>

버튼 클릭 시 같은 storyboard에 있는 ViewController를 화면에 띄워줍니다.

``` swift
let storyBoard = UIStoryboard(name: "Main", bundle: nil)
let detailViewController = storyBoard.instantiateViewController(identifier: "DetailViewController") as DetailViewController

self.present(detailViewController, animated: true, completion: nil)
```

## 2. Passing Data

### 2.1 ViewController 속성 값에 할당

``` swift
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
```

``` swift
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
```

### 2.2 segue를 통한 데이터 전달
하나의 스토리보드에 여러 ViewController가 있을 때 사용

``` swift
class ViewController: UIViewController {
    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // prepare를 사용하면 연결된 segue로 이동할 때 호출이 된다.
    // 따라서 원하는 segue를 찾아서 해당 viewCotroller의 속성 값에 값을 할당할 수 있다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "adbc"
            }
        }
    }
}
```

### 2.3 instance를 통으로 넘겨서 데이터 전달하기

``` swift
class ViewController: UIViewController {
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
}
```

``` swift
class InstanceDetailViewController: UIViewController {
    
    var mainVC: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendDataMainVC(_ sender: Any) {
        mainVC?.dataLabel.text = "some data"
        self.dismiss(animated: true, completion: nil)
    }
}
```

ViewController에서 버튼 클릭 시 InstanceDetailViewController를 가지고 온 다음 InstanceDetailViewController에서 들고 있는 mainVC: ViewController에 `self`를 할당함으로써 InstanceDetailViewController에 ViewController의 instance를 그대로 전달하면서 데이터 전달을 진행합니다.

### 2.4 delegate를 사용해서 data를 전달하는 방법

``` swift
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
```

delegate를 선언 방식으로 구현을 하고 실제로 버튼이 동작되는 부분에서 callback이 될 수 있도록 구현을 한다.
``` swift
class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!

    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        
        // 나 자신을 통으로 넘기는 것이 아니라 extension으로 구현한 구현부만 넘기게 된다.
        // 즉 DelegateDetailViewControllerDelegate 타입만 넘기는 것이다.
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
}
```
delegate를 전달하는 부분은 위와 같이 extension을 활용하여 해당 객체가 protocol를 구현할 수 있도록 하고 
self를 할당해 주면 된다.

### 2.5 Passing Data closure

Delegate 방식으로 다른 controller에 데이터를 전달하는 방식입니다.

``` swift
class ClosureDetailViewController: UIViewController {
    
    var myClosure: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closurePassData(_ sender: Any) {
        myClosure?("closure string")
        self.dismiss(animated: true, completion: nil)
    }
}
```

``` swift
class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        detailVC.myClosure = { str in
            self.dataLabel.text = str
        }
        
        self.present(detailVC, animated: true)
    }
}
```

### 2.6 Notification
Add observer by Notification.Name, and call observer by post function of NotificationCenter.
And then, through the function added to observer, you can get notification that has key value pair.

``` swift 
class ViewController: UIViewController {
    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("sendSomeString")
        // Don't call 'addObserver' twtice
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        // add observer before(will) showing keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        // add observer show keyboard completed
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
    }
  
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str;
        }
    }

    @objc func keyboardWillShow() {
        print("will show")
    }
    
    @objc func keyboardDidShow() {
        print("did show")
    }
    


    @IBAction func moveToNoti(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
}
```

``` swift
class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func notiAction(_ sender: Any) {
        let notificationName = Notification.Name("sendSomeString")
        
        let strDic = ["str" : "noti string"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
        self.dismiss(animated: true)
    }
}
```
## 3. Dispatch Queue

## main thread vs work thread
``` swift
// dispatch queue -> like task of C#
// create thread's' for management

import UIKit

class ViewController: UIViewController {
    
    // to check main thread working properly
    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var finishLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timerLabel.text = Date().timeIntervalSince1970.description
            
        }
    }
    
    // run on main thread
    // why ui job works in main thread?
    // -> when ui state updated, one thread has to manage it.
    // if multi thread manage it, you hardly to check this.
    // And app life cycle run on main thread.
    @IBAction func action1(_ sender: Any) {
        // finishLabel.text = "end"
        // simpleClousure {
        // finishLabel.text = "end_closure"
        // }
        multiThreadClosure {
            
            self.finishLabel.text = "end_multThread"
        }
    }
    
    func simpleClousure(complection: () -> Void) {
        
        for index in 0..<10 {
            // stop main thread temporarily.
            Thread.sleep(forTimeInterval: 0.2)
            print(index)
        }
        
        complection()
    }
    
    func multiThreadClosure(complection: @escaping () -> Void) {
        
        // run on work thread
        DispatchQueue.global().async {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        // run on main thread
        // ui must run on main thread
        DispatchQueue.main.async {
            complection()
        }
    }
    
    
    @IBAction func action2(_ sender: Any) {
        // simpleAction2()
        multiAction2()
        
    }
    
    // run on sync -> run on one thread
    func simpleAction2() {
        let dispatchGroup = DispatchGroup()
        
        // create a thread
        let queue1 = DispatchQueue(label: "q1")
        
        queue1.async(group: dispatchGroup) {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        // run on sync -> run on one thread
        queue1.async(group: dispatchGroup) {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        // run on sync -> run on one thread
        queue1.async(group: dispatchGroup) {
            for index in 20..<30 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
    }
    
    // run on multi threads
    // run on async
    func multiAction2() {
        let dispatchGroup = DispatchGroup()
        
        // create multi threads
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        
        // DispatchQoS.backgroud: the lowest priority
        // DispatchQoS.userInteractive: the highest priority.
        
        queue1.async(group: dispatchGroup, qos: .background) {
            // start job
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                // end job
                dispatchGroup.leave()
            }
        }
        
        queue2.async(group: dispatchGroup, qos: .userInteractive) {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        queue3.async(group: dispatchGroup) {
            for index in 20..<30 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        // if all threads work finished, excute code block
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("end")
        }
    }
    
    @IBAction func action3(_ sender: Any) {
        // create multi threads
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        queue1.sync {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }

            queue1.sync {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index;)
                }
            }
        }
        
        queue2.sync {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        print("aaaa")
    }
}
```