//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by 차동훈 on 2022/12/07.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    var fetchResults: PHFetchResult<PHAsset>?
    
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
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(checkPermission))
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.rightBarButtonItem = photoItem
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    @objc func checkPermission() {
        
        // authorized: 모두 허용
        // limited: 일부 허용
        if PHPhotoLibrary.authorizationStatus() == .authorized ||
            PHPhotoLibrary.authorizationStatus() == .limited {
            DispatchQueue.main.async {
                // UI를 보여주는 것은 메인 쓰레드에서 동작을 해야 한다.
                self.showGallery()
            }
            
        // denied: 거절
        } else if PHPhotoLibrary.authorizationStatus() == .denied {
            DispatchQueue.main.async {
                self.showAuthorizationDeniedAlert()
            }
            
        // notDetermined: 한 번도 권한을 물어보지 않은 상태
        } else if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization { status in
                self.checkPermission()
            }
        }
        
    }
    
    func showAuthorizationDeniedAlert() {
        let alert = UIAlertController(title: "포토라이브러리 접근 권한을 활성화 해주세요.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: { action in
            // 앱 설정 열기
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showGallery() {
        let library = PHPhotoLibrary.shared()
        var configuration = PHPickerConfiguration(photoLibrary: library)
        configuration.selectionLimit = 10
        let picker = PHPickerViewController(configuration: configuration)
        
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
    
    @objc func refresh() {
        self.photoCollectionView.reloadData()
    }


}

// table view이 기본 형태
// 연결된 table view의 갯수 및 현재 cell에 대해서 정의해 주고 있다.
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fetchResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        if let asset = self.fetchResults?[indexPath.row] {
            cell.loadImage(asset: asset)
        }
        
        return cell
    }
}

// 사진 선택(add) 후 콜백처리
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        let identifiers = results.map {
             $0.assetIdentifier ?? ""
        }
        self.fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        // 갯수가 업데이트 됨
        self.photoCollectionView.reloadData()
        
        self.dismiss(animated: true)
    }
}
