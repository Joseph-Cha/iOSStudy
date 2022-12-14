// dispatch queue -> like c# of task
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
    // why ui job work in main thread?
    // -> when ui state updated, one thread has to manage that.
    // if multi thread manage that, you hardly to check this.
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
    
    
    @IBAction func action2(_ sender: Any) {
//        simpleAction2()
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
            // set to start job manualy
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                // set to end job manualy
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
        
        // don't use that(main thread do not run on main thread).
        DispatchQueue.main.sync {
            
        }
        
        // create multi threads
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        queue1.sync {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
            // deadlock -> waiting for each other jobs until the other's.
            // previous job is not complected. so this job waits for previous job.
            // next job will run sync. so when all queue1 thread's job finished, next job will be excuted by queue1 thread.
            // that is why occur dead lock.
            queue1.sync {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
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
