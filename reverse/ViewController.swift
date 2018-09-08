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
        
        // labelを作成
        myLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        myLabel.backgroundColor = UIColor(red: 0.561, green: 0.737, blue: 0.561, alpha: 1.0)
        myLabel.center = self.view.center
        myLabel.text = "*･゜ﾟ･*:.｡..｡.:*･゜"
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.textColor = UIColor.white
        
        // SegmentedControllerを生成
        let mySegcon = UISegmentedControl(items: ["Spring", "Invert", "Rotate", "Scaling", "Move"])
        mySegcon.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 50)
        mySegcon.tintColor = UIColor.blue
        mySegcon.addTarget(self, action: #selector(ViewController.changedValue(sender:)), for: UIControlEvents.valueChanged)
        
        // labelをviewに追加
        self.view.addSubview(myLabel)
        
        // SegmentedControllerをViewに追加
        self.view.addSubview(mySegcon)
    }
    
    // SegmentedControllerん値が変わった時に呼ばれるメソッド
    @objc func changedValue(sender: UISegmentedControl){
        myLabel.center = self.view.center

        // 各アニメーションの処理
        switch(sender.selectedSegmentIndex) {
            // バネのような動きをするアニメーション
            case 0:
                // アインメーションの時間を2秒に設定
                UIView.animate(withDuration: 2.0,
                                // 遅延時間
                                delay: 0.0,
                                // バネの弾性力、小さいほど弾性力は大きくなる
                                usingSpringWithDamping: 0.2,
                                // 初速度
                                initialSpringVelocity: 1.5,
                                // 一定の速度
                                options: UIViewAnimationOptions.curveLinear,
                                
                                animations: { () -> Void in
                                    self.myLabel.layer.position = CGPoint(x: self.view.frame.width - 50, y: 100)
                                    // アニメーション完了時の処理
                })
                { (Bool) -> Void in
                self.myLabel.center = self.view.center
                }
            
            // X,Y方向にそれぞれ反転するアニメーション
            case 1:
                // アニメーションの時間を3秒に設定
                UIView.animate(withDuration: 3.0,
                    // アニメーション中の処理
                    animations: { () -> Void in
                        // X方向に反転用のアフィン行列作成
                        self.myLabel.transform = self.myLabel.transform.scaledBy(x: -1.0, y: 1.0)
                        // 連続したアニメーション処理
                }) { (Bool) -> Void in
                    UIView.animate(withDuration: 3.0,
                        // アニメーション中の処理
                        animations: { () -> Void in
                            // Y方向に反転用のアフィン行列作成
                            self.myLabel.transform = self.myLabel.transform.scaledBy(x: 1.0, y: -1.0)
                            // アニメーション完了時の処理
                    }) { (Bool) -> Void in
                    }
                }
                    
            // 回転アニメーション
            case 2:
                //初期化
                self.myLabel.transform = CGAffineTransform(rotationAngle: 0)
                // radianで回転角度を指定(９０度）
                let angle:CGFloat = CGFloat(M_PI_2)
                // アニメーションの秒数を設定（3秒）
                UIView.animate(withDuration: 3.0,
                               
                               animations: { () -> Void in
                                    // 回転用のアフィン行列を生成
                                    self.myLabel.transform = CGAffineTransform(rotationAngle: angle)
                                },
                               completion: { (Bool) -> Void in
                               }
                )
                
            // 拡大縮小アニメーション
            case 3:
                self.myLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                
                // アニメーションの時間を3秒に設定
                UIView.animate(withDuration: 3.0,
                               animations: { () -> Void in
                                // 縮小用アフィン行列を作成
                                self.myLabel.transform = CGAffineTransform(scaleX: 1.5, y:1.5)
                })
                // 連続したアニメーション処理
                { (Bool) -> Void in
                    UIView.animate(withDuration: 3.0,
                                    // アニメーション中の処理
                                    animations: { () -> Void in
                                        //拡大用アフィン行列の作成
                                        self.myLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    }) // アニメーション完了時の処理
                    { (Bool) -> Void in
                        // 大きさを元に戻す
                        self.myLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }
                }
                    
            // 移動するアニメーション
            case 4:
                myLabel.layer.position = CGPoint(x: -30, y: -30)

                // アニメーション処理
                UIView.animate(withDuration: TimeInterval(CGFloat(3.0)),
                                            animations: {() -> Void in
                                                // 異動先の座標を指定する
                                                self.myLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2);
                                            }, completion: {(Bool) -> Void in
                })

            default:
                print("error!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

