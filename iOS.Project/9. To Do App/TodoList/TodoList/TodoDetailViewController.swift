//
//  TodoDetailViewController.swift
//  TodoList
//
//  Created by 차동훈 on 2022/12/20.
//

import UIKit
import CoreData

protocol TodoDetailViewControllerDelegate: AnyObject {
    func didFinishSaveData()
}

class TodoDetailViewController: UIViewController {
    weak var delegate: TodoDetailViewControllerDelegate?
    
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            break
        case 2:
            break
        case 3:
            break
            
        default:
            break
            
        }
    }
    
    @IBAction func saveTodo(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else { return
        }
        
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoList else { return
        }
        
        object.title = titleTextField.text
        object.date = Date()
        object.uuid = UUID()
        
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
}
