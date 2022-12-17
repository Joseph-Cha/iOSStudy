//
//  ViewController.swift
//  TodoList
//
//  Created by 차동훈 on 2022/12/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Todo List"
        makeNavigationBar()
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
        
    func makeNavigationBar() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        item.tintColor = .black
        self.navigationItem.rightBarButtonItem = item
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .blue.withAlphaComponent(0.2)
        self.navigationController?.navigationBar.standardAppearance = barAppearance
    }
    
    @objc func addNewTodo() {
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        return cell
    }
    
    
}

