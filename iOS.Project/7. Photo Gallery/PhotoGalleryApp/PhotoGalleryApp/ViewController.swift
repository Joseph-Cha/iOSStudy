//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by 차동훈 on 2022/12/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Photo Gallery App"
        makeNavigationItem()
        
        // collection view 아이템의 layout 설정
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 1) / 2, height: 200)
        // 행 간격
        layout.minimumInteritemSpacing = 1
        // 열 간격
        layout.minimumLineSpacing = 1
        
        photoCollectionView.collectionViewLayout = layout
        
        photoCollectionView.dataSource = self
        
    }
    
    func makeNavigationItem() {
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(showGallery))
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.rightBarButtonItem = photoItem
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    @objc func showGallery() {
        
    }
    
    @objc func refresh() {
        
    }


}

// table view이 기본 형태
// 연결된 table view의 갯수 및 현재 cell에 대해서 정의해 주고 있다.
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
        
        return cell
    }
}
