//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var myLeftButton: UIBarButtonItem!
    private var myRightButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色をCyanに設定する
        self.view.backgroundColor = UIColor.cyan
        
        // NavigationControllerのタイトルを設定する
        self.title = "My Navigation"
        
        // 左ボタンを作成する
        myLeftButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.onClickMyButton(sender:)))
        
        // 右ボタンを作成する
        myRightButton = UIBarButtonItem(title: "RightBtn", style: .plain, target: self, action: #selector(ViewController.onClickMyButton(sender:)))
        
        // tagを設定する
        myLeftButton.tag = 1
        myRightButton.tag = 2
        
        // ナビゲーションバーの左に設置する
        self.navigationItem.leftBarButtonItem = myLeftButton
        
        // ナビゲーションバーの右に設置する
        self.navigationItem.rightBarButtonItem = myRightButton
        
    }
    
    // ボタンイベント
    
    @objc func onClickMyButton(sender: UIButton){
        
        switch(sender.tag){
            
        case 1:
            //背景色を青色にかえる
            self.view.backgroundColor = UIColor.blue
            
        case 2:
            // 背景色を赤色に変える
            self.view.backgroundColor = UIColor.red
            
        default:
            print("error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

