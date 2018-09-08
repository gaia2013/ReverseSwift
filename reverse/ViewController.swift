//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を黒色に設定
        self.view.backgroundColor = UIColor.black
        
        // Labelを生成
        myLabel = UILabel(frame: CGRect(x:0, y:0, width:80, height:80))
        myLabel.text = "Drag!"
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.backgroundColor = UIColor.red
        myLabel.layer.masksToBounds = true
        myLabel.center = self.view.center
        myLabel.layer.cornerRadius = 40.0
        
        // LabelをViewに追加
        self.view.addSubview(myLabel)
    }
    
    // タッチを感知した際に呼ばれるメソッド
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        
        // Labelアニメーション
        UIView.animate(withDuration: 0.06,
                       animations: { () -> Void in
                        // 縮小用アフィン行列を作成する
                        self.myLabel.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                        }
        )
        { (Bool) -> Void in
        }
    }
    
    // ドラッグを感知した際に呼ばれるメソッド（ドラッグ中なんども呼ばれる）
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touchesMoved")
        
        // タッチイベントを取得
        let aTouch: UITouch = touches.first!
        
        // 移動した先の座標を取得
        let location = aTouch.location(in: self.view)
        
        // 移動する前の座標を取得
        let prevLocation = aTouch.previousLocation(in: self.view)
        
        // CGRect生成
        var myFrame: CGRect = self.view.frame
        
        // ドラッグで移動したx、y距離をとる
        let deltaX: CGFloat = location.x - prevLocation.x
        let deltaY: CGFloat = location.y - prevLocation.y
        
        // 移動した分の距離をmyFrameの座標にプラスする
        myFrame.origin.x += deltaX
        myFrame.origin.y += deltaY
        
        // frameにmyFrameを追加
        self.view.frame = myFrame
    }
    
    // 指が離れたことを感知した際に呼ばれるメソッド
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touchesEneded")
        
        // Labelアニメーション
        UIView.animate(withDuration: 0.1,
                       // アニメーション中の処理
            animations: { () -> Void in
                // 拡大用アフィン行列を作成する
                self.myLabel.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                // 縮小用アフィン行列を作成する
                self.myLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        )
        { (Bool) -> Void in }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

