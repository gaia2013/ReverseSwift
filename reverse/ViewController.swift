//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//  現Viewの上に別Viewを表示する

import UIKit

class ViewController: UIViewController {
    
    var myView: UIView!
    var myButton: UIButton!
    var flag: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view表示・非表示のためのフラグ
        flag = false
        
        // viewの背景を青色に設定
        self.view.backgroundColor = UIColor.cyan
        
        // Viewを生成
        myView = UIView(frame: CGRect(x:0, y:0, width:100, height:100))
        
        // myViewの背景を緑色に設定
        myView.backgroundColor = UIColor.green
        
        // 透明度を設定
        myView.alpha = 0.5
        
        // 位置を中心に設定
        myView.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height/2)
        
        // myViewを非表示
        myView.isHidden = true
        
        // ボタンを生成
        myButton = UIButton(frame: CGRect(x:0, y:0, width:100, height:50))
        myButton.backgroundColor = UIColor.red
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height - 50)
        myButton.setTitle("Apper", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        
        // myViewをViewに追加
        self.view.addSubview(myView)
        
        // ボタンをViewに追加
        self.view.addSubview(myButton)
    }
    
    // ボタンイベント
    @objc func onClickMyButton(sender: UIButton) {
        
        // flagがfalseならmyViewを表示
        if !flag {
            // myViewを表示
            myView.isHidden = false
            
            // ボタンのタイトルを変更
            myButton.setTitle("Disappear", for: .normal)
            flag = true
        }
        // flagがtrueならmyViewを非表示
        else {
            
            // myViewを表示
            myView.isHidden = true
            // ボタンのタイトルを変更
            myButton.setTitle("Appear", for: .normal)
            flag = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

