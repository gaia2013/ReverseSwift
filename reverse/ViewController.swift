//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var myTextField: UITextField!
    var suggestTextField : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // myButtonを生成
        let myButton = UIButton()
        myButton.frame = CGRect(x:0, y:0, width:200, height:40)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.setTitle("チェックする", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
        
        // 候補用TextFieldを生成
        suggestTextField = UITextView(frame: CGRect(x:0, y:0, width: 300, height: 250))
        suggestTextField.layer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY + 150)
        suggestTextField.backgroundColor = UIColor.black
        suggestTextField.textColor = UIColor.white
        suggestTextField.textAlignment = NSTextAlignment.left
        suggestTextField.text = "もしかして: "
        suggestTextField.font = UIFont.systemFont(ofSize: CGFloat(20))
        suggestTextField.isEditable = false
        self.view.addSubview(suggestTextField!)
        
        // スペル入力用UITextFieldを作成
        myTextField = UITextField(frame: CGRect(x:0, y:0, width:200, height:30))
        myTextField.borderStyle = UITextBorderStyle.roundedRect
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2, y:100)
        self.view.addSubview(myTextField)
    }
    
    // Buttonが押された時に呼ばれるメソッド
    @objc func onClickMyButton(sender : UIButton) {
        
        // スペルチェックを行う
        suggestUpdate()
    }
    
    // スペルチェックするメソッド
    @objc func suggestUpdate(){
        
        // UITextCheckerの宣言
        let checker : UITextChecker = UITextChecker()
        
        // textの文字数を取得
        let length = myTextField.text?.characters.count
        
        // スペルチェックをする範囲（0〜入力された文字数）を指定
        let checkRange: NSRange = NSMakeRange(0, length!)
        
        // 範囲の中から間違ったスペルのものを探す
        let misspelledRange: NSRange = checker.rangeOfMisspelledWord(
            
            // チェックする文字を指定
            in: myTextField.text!,
            
            // チェックする範囲を指定
            range: checkRange,
            
            // 開始位置を範囲の先頭に指定
            startingAt: checkRange.location,
            
            // 指定された範囲内にミスが見つからなくてもrangeの開始位置から探し始める。(falseならミスが見つからなかった末尾の位置を保持する）
            wrap: true,
            
            // 言語を英語に指定
            language: "en_US")
        
        // スペルミスが見つかった場合
        if misspelledRange.location != NSNotFound {
            
            // 正しいスペルの候補を取得
            let candidateArray: NSArray = checker.guesses(
                
                // スペルミスがある範囲
                forWordRange: misspelledRange,
                
                // スペルミスを含む文字(range内)
                in: myTextField.text!,
                
                // 言語を指定
                language: "en_US")! as NSArray
            
            var str = "もしかして:\n"
            
            // 候補を配列から１つずつ取り出す
            for text in candidateArray {
                str += (text as AnyObject).description!
                str += ", "
            }
            suggestTextField?.text = str
        }
    }
    
}

