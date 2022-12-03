//
//  DraggableView.swift
//  PanGestureApp
//
//  Created by 차동훈 on 2022/12/02.
//

import UIKit

class DraggableView: UIView {
    
    init() {
        // frame: 기본 크기 설정
        super.init(frame: CGRect.zero)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UIPanGestureRecognizer를 통해 PanGesture 값을 얻어올 수 있다.
    @objc func dragging(pan: UIPanGestureRecognizer) {
        switch pan.state {
        // 누른 순간
        case .began:
            print("began")
        
        // 누르고 움직일 때
        case .changed:
            // 움직인 만큼의 값을 알려준다.
            // 현재 부모 뷰를 기준으로 얼만큼 이동했는지를 알려준다.
            let delta = pan.translation(in: self.superview)
            
            // 현재 view의 기준점을 center로 생각한다.
            var myPosition = self.center
            myPosition.x += delta.x
            myPosition.y += delta.y
            self.center = myPosition
            
            // 내가 움직인 만큼 이동을 끝낸 다음 pan을 초기화 해준다.
            pan.setTranslation(CGPoint.zero, in: self.superview)
            
        // ended: 움직임이 끝났을 때
        // cancelled: 누르고 멀리 이동하는 등, 이동이 취소 되었을 때
        case .ended, .cancelled:
            print("ended, cancelled")
        
        default:
            break
        }
    }
}
