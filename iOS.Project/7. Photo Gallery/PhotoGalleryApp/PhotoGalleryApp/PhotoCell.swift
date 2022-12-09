//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by 차동훈 on 2022/12/07.
//

import Foundation
import UIKit
import Photos

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill
        }
    }
    
    func loadImage(asset: PHAsset) {
        let imageManager = PHImageManager()
        let scale = UIScreen.main.scale
        // scale을 곱하는 이유 -> 핸드폰 해상도와 맞추기 위해서
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
        
        let options = PHImageRequestOptions()
        // .highQualityFormat: 이미지를 요청할 때 고화질로 요청
        // .fastFormat: 이미지를 요청할 때 저화질로 요청
        // .opportunistic: 저화질 고화질 모두 요청
        options.deliveryMode = .opportunistic
        
        self.photoImageView.image = nil
        
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options) { image, info in
            
            if (info?[PHImageResultIsDegradedKey] as? Bool) == true {
                // 저화질
            } else {
                // 고화질
            }
            self.photoImageView.image = image
            
        }
    }
}
