//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UIDynamicAnimatorのインスタンスを保存しなければアニメーションが実行されない
    var animator : UIDynamicAnimator!
    
    var gravity : UIGravityBehavior!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.cyan
        
        // Buttonを作成
        let myButton = UIButton(frame: CGRect(x:0, y:0, width:200, height:50))
        myButton.layer.position = self.view.center
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        myButton.backgroundColor = UIColor.red
        myButton.setTitle("Dropped!", for: UIControlState.normal)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(myButton)
        
        // myButtonをつなぐスプリングを作成
        let springView = UIView(frame: CGRect(x:0, y:0, width: 5, height: 50))
        springView.layer.position = self.view.center
        springView.backgroundColor = UIColor.brown
        self.view.addSubview(springView)
        
        // UIDynamicAnimatorの生成とインスタンスの保存
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // 重力を生成したButtonに付随させる
        gravity = UIGravityBehavior(items: [myButton])
        
        // アタッチを生成
        let attach = UIAttachmentBehavior(item: myButton, attachedToAnchor: self.view.center)
        
        // 減衰値
        attach.damping = 0.01
        
        // 振幅
        attach.frequency = 1.0
        
        // ひもの長さ
        attach.length = 100
        
        // アニメーションが動いている際に呼ばれるブロック文を設定
        attach.action = {
            var rect = springView.frame
            rect.size.height = myButton.frame.origin.y - rect.origin.y
            springView.frame = rect
        }
        
        // UIDyanamicAnimatorにアタッチを追加
        animator.addBehavior(attach)
    }
    
    // Buttonを押した時によばれるメソッド
    @objc func onClickMyButton(sender: UIButton){
        
        // UIDynamicAnimatorに重力を追加
        animator.addBehavior(gravity)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

