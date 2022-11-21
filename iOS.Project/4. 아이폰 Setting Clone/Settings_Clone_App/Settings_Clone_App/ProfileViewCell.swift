//
//  ProfileViewCell.swift
//  Settings_Clone_App
//
//  Created by 차동훈 on 2022/11/21.
//

import UIKit

class ProfileViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomDescription: UILabel!
    // nib의 최초 실행 코드
    override func awakeFromNib() {
        super.awakeFromNib()
        let profileImageHeight: CGFloat = 60
        profileImageView.layer.cornerRadius = profileImageHeight / 2
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        bottomDescription.textColor = .darkGray
        bottomDescription.font = UIFont.systemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
