//
//  OnBoardingItemViewController.swift
//  OnBoardingViewApp
//
//  Created by 차동훈 on 2022/12/05.
//

import UIKit

class OnBoardingItemViewController: UIViewController {

    var mainText = ""
    var subText = ""
    var topImage: UIImage? = UIImage()
    
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = .systemFont(ofSize: 14, weight: .light)
        }
    }
    @IBOutlet private weak var mainTitleLabel: UILabel! {
        didSet {
            mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
    @IBOutlet private weak var topImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLabel.text = mainText
        topImageView.image = topImage
        descriptionLabel.text = subText
    }

}
