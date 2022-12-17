//
//  TotoCelll.swift
//  TodoList
//
//  Created by 차동훈 on 2022/12/17.
//

import UIKit

class TodoCelll: UITableViewCell {

    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var prioirtyView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
