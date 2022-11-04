//
//  SegueDetailViewController.swift
//  PassData
//
//  Created by 차동훈 on 2022/11/04.
//

import UIKit

class SegueDetailViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        dataLabel.text = dataString
        // Do any additional setup after loading the view.
    }

}
