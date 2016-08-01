//
//  KTCUtil.swift
//  TestKitchen_Swift
//
//  Created by gaokunpeng on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class KTCUtil: NSObject {
    
    //标签
    class func createLabel(text: String?,font: UIFont?,textColor: UIColor?,textAlignment: NSTextAlignment?) -> UILabel {
        
        let label = UILabel()
        
        if text != nil {
            label.text = text
        }
        
        if font != nil {
            label.font = font
        }
        
        if textColor != nil {
            label.textColor = textColor
        }
        
        if textAlignment != nil {
            label.textAlignment = textAlignment!
        }
        
        return label
    }
    
    //按钮
    class func createBtn(title: String?, bgImageName: String?,selectBgImageName: String?, target: AnyObject?, action: Selector) -> UIButton {
        
        let btn = UIButton(type: .Custom)
        
        if title != nil {
            btn.setTitle(title, forState: .Normal)
            btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        
        
        if bgImageName != nil {
            btn.setBackgroundImage(UIImage(named: bgImageName!), forState: .Normal)
        }
        
        if selectBgImageName != nil {
            btn.setBackgroundImage(UIImage(named: selectBgImageName!), forState: .Selected)
        }
        
        if target != nil && action != nil {
            btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
        
        return btn
    }
    
    
    //图片
    class func createImageView(imageName: String?) -> UIImageView {
        
        let imageView = UIImageView()
        
        if imageName != nil {
            imageView.image = UIImage(named: imageName!)
        }
        
        return imageView
    }
    
    
    //视图
    class func createView() -> UIView {
        let myView = UIView()
        return myView
    }
    
    
    

}
