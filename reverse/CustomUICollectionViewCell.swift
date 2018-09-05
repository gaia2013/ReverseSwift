//
//  CustomUICollectionViewCell.swift
//  reverse
//
//  Created by 山口仁志 on 2018/09/05.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

class CustomUICollectionViewCell : UICollectionViewCell{
    
    var textLabel : UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI Labelを生成
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height: frame.height))
        textLabel?.text = "nil"
        textLabel?.textAlignment = NSTextAlignment.center
        
        // Cellに追加
        self.contentView.addSubview(textLabel!)
    }
}
