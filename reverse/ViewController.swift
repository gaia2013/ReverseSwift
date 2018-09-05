//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

extension UIImage{
    
    //Resizeのクラスメソッドを作る
    class func ResizeUIImage(image : UIImage, width : CGFloat, height : CGFloat) -> UIImage! {
        
        // 指定された画像の大きさのコンテキストを用意
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // コンテキストに画像を描画する
        image.draw(in: CGRect(x:0, y:0, width:width, height: height))
        
        // コンテキストからUIImageを作る
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画像の設定
        let myImage:UIImage = UIImage(named: "sample2.jpg")!
        
        // リサイズされたUIImageを指定して、UIImageViewを作る
        let myImageView = UIImageView(image: UIImage.ResizeUIImage(image: myImage, width: self.view.frame.maxX, height: self.view.frame.maxY))
        
        // 透過する
        myImageView.alpha = 0.3
        
        // viewにUIImageViewを追加
        self.view.addSubview(myImageView)
    }


}

