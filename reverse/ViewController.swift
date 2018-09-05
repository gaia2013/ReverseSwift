//
//  ViewController.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var myCollectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CollectionViewのレイアウトを生成
        let layout = UICollectionViewFlowLayout()
        
        // Cellのひとつ一つの大きさ
        layout.itemSize = CGSize(width: 50, height: 50)
        
        // Cellのマージン
        layout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16)
        
        // セクションごとのヘッダーサイズ
        layout.headerReferenceSize = CGSize(width: 100, height: 50)
        
        // CollectionViewを生成
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        // Cellに使われるクラスを登録
        myCollectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Section")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        self.view.addSubview(myCollectionView)
        
    }
    
    // Sectionの数
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    // Cellが選択された際に呼び出される
    
    @objc func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Num: \(indexPath.row)")
        print("SectionNum:\(indexPath.section)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // SectionごとにCellの総数を帰る
        switch(section) {
        case 0:
            return 5
        case 1:
            return 8
        case 2:
            return 20
        default:
            print("error")
            return 0
        }
    }
    
    // Sectionに値を設定する
    @objc func collectionview(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Section", for:  indexPath)
        
        headerView.backgroundColor = UIColor.white
        
        return headerView
    }
    
    // Cellに値を設定する
    @objc func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! CustomUICollectionViewCell
        
        // SectionごとにCellのプロパティをかえる
        switch (indexPath.section) {
        case 0:
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "0"
            
        case 1:
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text = "1"
            
        case 2:
            cell.backgroundColor = UIColor.blue
            cell.textLabel?.text = "2"
            
        default:
            print("section error")
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }


}

