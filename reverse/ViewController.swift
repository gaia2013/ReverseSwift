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
    var myLabel : UILabel!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 背景を水色に設定
        self.view.backgroundColor = UIColor.cyan
        
        // Labelを作成
        myLabel = UILabel(frame: CGRect(x:0,y:0,width:200,height:50))
        myLabel.backgroundColor = UIColor.orange
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello Swift!"
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.gray
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2 , y: 200)
        self.view.backgroundColor = UIColor.cyan
        self.view.addSubview(myLabel)
        
        // UIDynamicAnimator の生成とインスタンスの保存
        animator = UIDynamicAnimator(referenceView: self.view)
    }
    
    // タップを感知した時に呼ばれるメソッど

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch : AnyObject in touches {
            
            // タッチされた座標を取得
            let location = touch.location(in: self.view)
            
            // animatorに登録されていたBehaviorを全て削除
            animator.removeAllBehaviors()
            
            // UIViewをスナップさせるUISnapBehaviorを生成
            let snap = UISnapBehavior(item: myLabel, snapTo: location)
            
            // スナップを適用させる
            animator.addBehavior(snap)
        }
    }
}

