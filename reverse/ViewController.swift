//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

extension UIImage {
    
    // 画像をResizeするクラスメソッド
    class func ResizeUIImage(image : UIImage, width: CGFloat, height : CGFloat) -> UIImage!{
        
        // 指定された画像の大きさのコンテキストを用意
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // コンテキストに画像を描画する
        image.draw(in: CGRect(x:0, y:0, width: width, height: height))
        
        // コンテキストからUIImageを作る
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    // 画像を合成するクラスメソッド
    class func ComposeUIImage(UIImageArray : [UIImage], width: CGFloat, height: CGFloat) -> UIImage!{
        
        // 指定された画像の大きさのコンテキストを用意
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // UIImageのある分回す
        for image : UIImage in UIImageArray {
            
            // コンテキストに画像を描画する
            image.draw(in: CGRect(x:0, y:0, width: image.size.width, height: image.size.height))
        }
        
        // コンテキストからUIImageを作る
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        // １つ目のUIImageを作る
        var myImage1 = UIImage(named: "sample1.jpeg")!
        
        // リサイズする
        myImage1 = UIImage.ResizeUIImage(image: myImage1, width: self.view.frame.maxX, height: self.view.frame.maxY)
        
        // 2つめのUIImageをつくる
        var myImage2 = UIImage(named: "sample2.jpg")!
        
        // リサイズする
        myImage2 = UIImage.ResizeUIImage(image: myImage2, width: self.view.frame.midX, height: self.view.frame.midY)
        
        // 画像を合成する
        let ComposedImage = UIImage.ComposeUIImage(UIImageArray: [myImage1, myImage2], width: self.view.frame.maxX, height: self.view.frame.maxY)
        
        // UIImageViewに合成されたUIImageを指定する
        let myImageView = UIImageView(image: ComposedImage)
        
        self.view.addSubview(myImageView)
        
    }

}

