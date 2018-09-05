//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

extension UIView {
    
    func GetImage() -> UIImage{
        
        // キャプチャする範囲を取得
        let rect = self.bounds
        
        // ビットマップ画像のcontextを作成
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        // 対象のView内の描画をcontextに複写する
        self.layer.render(in: context)
        
        // 現在のcontextのビットマップをUIImageとして取得
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // Contextを閉じる
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
}

class ViewController: UIViewController {
    
    var myLabel: UILabel!
    var myImageView: UIImageView!

    override func viewDidLoad() {
        
        // Labelを生成
        myLabel = UILabel(frame: CGRect(x:0, y:0, width:100, height:100))
        myLabel.text = "test"
        myLabel.textColor = UIColor.white
        myLabel.layer.cornerRadius = 50.0
        myLabel.layer.masksToBounds = true
        myLabel.backgroundColor = UIColor.blue
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height/2 - 100)
        
        // ImageViewを生成
        myImageView = UIImageView(frame: CGRect(x:0, y:0, width:150, height:150))
        myImageView.layer.borderColor = UIColor.black.cgColor
        myImageView.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height - 200)
        myImageView.layer.borderWidth = 0.5
        
        // Buttonを生成
        let myButton = UIButton(frame: CGRect(x:0, y:0, width:50, height: 20))
        myButton.setTitle("push", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
        myButton.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height - 50)
        
        // viewにそれぞれを追加
        self.view.addSubview(myLabel)
        self.view.addSubview(myImageView)
        self.view.addSubview(myButton)
    }

    // Buttonが押された時に呼ばれるメソッド
    @objc func onClickMyButton(sender: UIButton) {
        // キャプチャ画像を取得
        let myImage = myLabel.GetImage() as UIImage
    
        // ImageViewのimageにセット
        myImageView.image = myImage
    
        // 縦横比率を保ちつつ画像をUIImageViewの大きさに合わせる
        myImageView.contentMode = UIViewContentMode.scaleAspectFit
    }
}

