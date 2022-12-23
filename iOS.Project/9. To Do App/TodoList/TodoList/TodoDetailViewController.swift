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
    
    var priority: PriorityLevel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = normalButton.bounds.height / 2
        highButton.layer.cornerRadius = highButton.bounds.height / 2
    }
    
    @IBAction func setPriority(_ sender: UIButton) {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear
        
        switch sender.tag {
        case 1:
            priority = .level1
            lowButton.backgroundColor = priority?.color
            break
        case 2:
            priority = .level2
            normalButton.backgroundColor = priority?.color
            break
        case 3:
            priority = .level3
            highButton.backgroundColor = priority?.color
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
        
        object.priorityLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
}
