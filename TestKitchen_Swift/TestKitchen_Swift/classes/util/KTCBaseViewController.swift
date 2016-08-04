//
//  KTCBaseViewController.swift
//  TestKitchen_Swift
//
//  Created by gaokunpeng on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class KTCBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addNavTitle(title: String){
        let label = KTCUtil.createLabel(title, font: UIFont.boldSystemFontOfSize(20), textColor: UIColor.blackColor(), textAlignment: .Center)
        label.frame = CGRectMake(80, 0, kScreenW-160, 44)
        self.navigationItem.titleView = label
    }
    
    func addNavBtnImages(imageArray: Array<String>, target: AnyObject, action: Selector, isLeft: Bool) {
        
        var btnArray = Array<UIBarButtonItem>()
        
        for i in 0..<imageArray.count {
            
            let imageName = imageArray[i]
            
            let btn = KTCUtil.createBtn(nil, bgImageName: imageName, selectBgImageName: nil, target: target, action: action)
            btn.frame = CGRectMake(0, 8, 32, 32)
            btn.tag = 300+i
            
            let item = UIBarButtonItem(customView: btn)
            btnArray.append(item)
        }
        
        if (isLeft) {
            self.navigationItem.leftBarButtonItems = btnArray
        }else{
            self.navigationItem.rightBarButtonItems = btnArray
        }
    }
    
    
    
    func addBackBtnTarget(target:AnyObject, action: Selector) {
        self.addNavBtnImages(["nav_back_black"], target: target, action: action, isLeft: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
