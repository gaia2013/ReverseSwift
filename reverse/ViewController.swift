//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit
import AVFoundation

// AudioPlayerDelegateプロトコルを採用
class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // 変数宣言
    var myAudioPlayer : AVAudioPlayer!
    var myButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 再生する音源のurlを生成
        let soundFilePath : String = Bundle.main.path(forResource: "Sample", ofType: "mp3")!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        // AVAudioPlayerのインスタンス化
        myAudioPlayer = try! AVAudioPlayer(contentsOf: fileURL)
        
        // AVAudioPlayerのデリゲートをセット
        myAudioPlayer.delegate = self
        
        // ボタンの生成
        myButton = UIButton()
        myButton.frame.size = CGSize(width: 100, height: 100)
        myButton.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        myButton.setTitle("▶︎", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.black, for: .normal)
        myButton.backgroundColor = UIColor.cyan
        myButton.addTarget(self, action: #selector(onClickMyButton), for: UIControlEvents.touchUpInside)
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 50.0
        self.view.addSubview(myButton)
    }
    
    // ボタンがタップされた時に呼ばれるメソッド
    @objc func onClickMyButton(sender: UIButton){
        
        // playingプロパティがtrueであれば音源再生中
        if myAudioPlayer.isPlaying == true {
            
            // myAudioPlayerを一時停止
            myAudioPlayer.pause()
            sender.setTitle("▶︎", for: .normal)
        } else {
            // myAudioPlayerの再生
            myAudioPlayer.play()
            sender.setTitle("■", for: .normal)
        }
    }
    
    // MARK: - AVAudioPlayerDelegate
    
    // 音源再生が成功した時に呼ばれるメソッド
    @objc func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if !flag { return }
        
        print("Music Finish")
        // サイドmyButtonを"▶︎"に設定
        myButton.setTitle("▶︎", for: .normal)
    }
    
    // デコード中にえらーがおきたときによばレルメソッド
    @objc func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let e = error {
            print("Error")
            print(e.localizedDescription)
            return
        }
    }
}

