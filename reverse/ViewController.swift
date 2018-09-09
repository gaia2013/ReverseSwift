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
        
        // WebViewを生成
        let myWebView = UIWebView()
        myWebView.frame = self.view.bounds
        
        // viewにWebViewを追加
        self.view.addSubview(myWebView)
        
        // プロジェクトに管理されているファイルのpathを取得
        let path: NSString = Bundle.main.path(forResource: "document", ofType: "pdf")! as NSString
        
        let url = NSURL(fileURLWithPath: path as String)
        let request = NSURLRequest(url: url as URL)
        
        // リクエストロード
        myWebView.loadRequest(request as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

