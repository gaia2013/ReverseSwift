//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var myScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ScrollViewを生成
        myScrollView = UIScrollView()
        
        // ScrollViewの大きさを設定する
        myScrollView.frame = self.view.frame
        
        // UIImageに画像を保存する
        let myImage = UIImage(named: "temple.jpg")!
        
        // UIImageViewを生成する
        let myImageView = UIImageView()
        
        // myImageViewのImageにmyImageを設定する
        myImageView.image = myImage
        
        // frameの値を設定する
        myImageView.frame = myScrollView.frame
        
        // 画像のアスペクト比を設定
        myImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        // ScrollViewにmyImageViewを追加する
        myScrollView.addSubview(myImageView)
        
        // Scrollの高さを計算しておく
        let scroll_height = myImage.size.height*(self.view.frame.width/myImage.size.width)
        
        // ScrollviewにcontentSizeを設定する
        myScrollView.contentSize = CGSize(width:self.view.frame.width, height: scroll_height)
        
        // ViewにScrollViewをAddする
        self.view.addSubview(myScrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

