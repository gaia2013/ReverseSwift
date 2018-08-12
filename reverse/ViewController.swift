//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景色をGreenに設定する
        self.view.backgroundColor = UIColor.green
        
        // ボタンを生成する
        let nextButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        nextButton.backgroundColor = UIColor.red
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 20.0
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        nextButton.addTarget(self, action: #selector(onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
        
        // ボタンを追加する
        self.view.addSubview(nextButton);
    }
    
    // ボタンイベント
    @objc func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義する
        let mySecondViewController: UIViewController = SecondViewController()
        
        // アニメーションを設定する。
        mySecondViewController.modalTransitionStyle = .partialCurl
        
        // Viewの移動する
        self.present(mySecondViewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

