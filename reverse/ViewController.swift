//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    var myWebView: UIWebView!
    var myPDFurl: NSURL!
    var myRequest: NSURLRequest!
    var myIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Buttonを生成
        let myButton: UIButton = UIButton(frame: CGRect(x:0, y:0, width:200, height:50))
        myButton.layer.cornerRadius = 20.0
        myButton.layer.masksToBounds = true
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 50)
        myButton.backgroundColor = UIColor.orange
        myButton.setTitle("Open PDF", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(myButton)
        
        // PDFを開くためのWebViewを生成
        myWebView = UIWebView(frame: CGRect(x:0, y:0, width: self.view.frame.width, height: self.view.frame.height))
        myWebView.delegate = self
        myWebView.scalesPageToFit = true
        myWebView.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height/2)
        
        // URLRequestを生成
        myPDFurl = NSURL(string: "https://developer.apple.com/jp/documentation/CocoaEncyclopedia.pdf")!
        myRequest = NSURLRequest(url: myPDFurl as URL)
        
        // ページ読み込み中に表示させるインジケータを生成
        myIndicator = UIActivityIndicatorView(frame: CGRect(x:0, y:0, width:50, height:50))
        myIndicator.center = self.view.center
        myIndicator.hidesWhenStopped = true
        myIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    }
    
    // インジケータのアニメーション開始
    @objc func startAnimation() {
        
        // NetworkActivityIndicatorを表示
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // UIActivityIndicatorを表示
        if !myIndicator.isAnimating {
            myIndicator.startAnimating()
        }
        
        // Viewにインジケータを追加
        self.view.addSubview(myIndicator)
    }
    
    // インジケータのアニメーション終了
    @objc func stopAnimation() {
        // NetworkActivityIndicatorを非表示
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        // UIActivityIndicatorを非表示
        if myIndicator.isAnimating {
            myIndicator.stopAnimating()
        }
    }
    
    // Buttonが押された時に呼ばれるメソッド
    @objc func onClickMyButton(sender: UIButton){
        
        // WebViewのLoad開始
        myWebView.loadRequest(myRequest as URLRequest)
        
        // viewにWebViewを追加
        self.view.addSubview(myWebView)
    }
    
    // WebViewのloadが開始された時に呼ばれるメソッド
    @objc func webViewDidStartLoad(_ webView: UIWebView) {
        print("load started")
        
        startAnimation()
    }
    
    // WebViewのloadが終了した時に呼ばれるメソッド
    @objc func webViewDidFinishLoad(_ webView: UIWebView) {
        print("load finished")
        
        stopAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

