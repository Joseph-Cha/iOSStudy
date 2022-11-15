// dispatch queue
// create thread's' for manage

import UIKit

class ViewController: UIViewController {
    
    // to check main thread work properly
    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var finishLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timerLabel.text = Date().timeIntervalSince1970.description
            
        }
    }
    
    // run on main thread
    @IBAction func action1(_ sender: Any) {
        // finishLabel.text = "end"
//        simpleClousure {
//            finishLabel.text = "end_closure"
//        }
        multiThreadClosure {
            
            self.finishLabel.text = "end_multThread"
        }
    }
    
    func simpleClousure(complection: () -> Void) {
        
        for index in 0..<10 {
            // stop main thread temporarily.
            // because of stopping main thread, it couldn't run function of complection.
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
}

