//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UIDynamicAnimatorはインスタンスを保存しなければアニメーションが十国されない
    var animator : UIDynamicAnimator!
    
    var gravity : UIGravityBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        // Labelを作成
        let myLabel: UILabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:40))
        myLabel.backgroundColor = UIColor.orange
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello Swift!"
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.gray
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x:self.view.bounds.width/2, y:-200)
        self.view.addSubview(myLabel)
        
        // 障害物を作成
        let myBoxView = UIView(frame: CGRect(x:0, y:0, width: 50, height: 40))
        myBoxView.backgroundColor = UIColor.blue
        myBoxView.layer.masksToBounds = true
        myBoxView.layer.position = CGPoint(x: self.view.frame.midX - 50, y:self.view.frame.midY)
        self.view.addSubview(myBoxView)
        
        // DropButtonを作成
        let myButton = UIButton(frame: CGRect(x:0, y:0, width:200, height:50))
        myButton.layer.position = CGPoint(x:self.view.frame.midX, y:500)
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        myButton.backgroundColor = UIColor.red
        myButton.setTitle("Dropped!", for: UIControlState.normal)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
        myButton.tag = 0
        self.view.addSubview(myButton)
        
        // ResetButtonを作成
        let myResetButton = UIButton(frame: CGRect(x:0, y:0, width:200, height:50))
        myResetButton.layer.position = CGPoint(x:self.view.frame.midX, y:400)
        myResetButton.layer.masksToBounds = true
        myResetButton.layer.cornerRadius = 20.0
        myResetButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myResetButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        myResetButton.backgroundColor = UIColor.blue
        myResetButton.setTitle("Reset!", for: UIControlState.normal)
        myResetButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
        myResetButton.tag = 1
        self.view.addSubview(myResetButton)
        
        // UIDynamicAnimatorの生成とインスタンスの保存
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // 重力を作り、Viewに適用させる
        gravity = UIGravityBehavior(items: [myLabel])
        
        // Collisionを作成、Viewに適用される
        let collision = UICollisionBehavior(items: [myLabel,myBoxView])
        
        // Collisionの挙動を指定
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: myBoxView.frame))
        
        // Collisionのアニメーションを実行
        animator.addBehavior(collision)
    }
    
    @objc func onClickMyButton(sender : UIButton){
        
        switch(sender.tag) {
            
            // DropButton
        case 0:
            // Gravityのアニメーションを実行
            animator.addBehavior(gravity)
            
        // ResetButton
        case 1:
            
            let next = ViewController()
            self.present(next, animated: false, completion: nil)
            
        default:
            print("error!")
        }
    }

}

