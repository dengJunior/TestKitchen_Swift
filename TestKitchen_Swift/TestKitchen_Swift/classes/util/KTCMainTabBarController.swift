//
//  KTCMainTabBarController.swift
//  TestKitchen_Swift
//
//  Created by gaokunpeng on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class KTCMainTabBarController: UITabBarController {
    
    
    //标签栏
    private var bgTabView: UIView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //创建视图控制器
        self.createViewControllers()
        
        //隐藏系统tabbar
        self.tabBar.hidden = true
        
        //自定制tabbar
        self.createMyTabbar()
        
        
    }

    
    //创建视图控制器
    func createViewControllers(){
        
        let ctrlNameArray = ["TestKitchen_Swift.CookbookViewController","TestKitchen_Swift.CommunityViewController","TestKitchen_Swift.MallViewController","TestKitchen_Swift.FoodclassViewController","TestKitchen_Swift.MineViewController"]
        
        
        var ctrlArray = Array<UINavigationController>()
        for i in 0..<ctrlNameArray.count {
            
            let clsName = ctrlNameArray[i]
            let cls = NSClassFromString(clsName) as! UIViewController.Type
            
            let vCtrl = cls.init()
            
            let navCtrl = UINavigationController(rootViewController: vCtrl)
            
            ctrlArray.append(navCtrl)
            
        }
        
        self.viewControllers = ctrlArray
    }
    
    
    //自定制tabbar
    func createMyTabbar(){
        
        
        self.bgTabView = KTCUtil.createView()
        self.bgTabView?.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        self.view.addSubview(self.bgTabView!)
        
        //约束
        self.bgTabView?.snp_makeConstraints(closure: { (make) in
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.height.equalTo(49)
        })
        
        
        //循环创建按钮
        let imageArray = ["home_normal","community_normal","shop_normal","shike_normal","mine_normal"]
        let sImageArray = ["home_select","community_select","shop_select","shike_select","mine_select"]
        let nameArray = ["食材","社区","商城","食课","我的"]
        
        let w = kScreenW/CGFloat(imageArray.count)
        
        for i in 0..<imageArray.count {

            //按钮
            let btn = KTCUtil.createBtn(nil, bgImageName: imageArray[i], selectBgImageName: sImageArray[i], target: self, action: #selector(clickBtn(_:)))
            btn.tag = 200+i
            self.bgTabView?.addSubview(btn)
            
            
            //文字
            let label = KTCUtil.createLabel(nameArray[i], font: UIFont.systemFontOfSize(10), textColor: UIColor.grayColor(), textAlignment: .Center)
            label.tag = 300
            btn.addSubview(label)
            
            if (i == 0) {
                //默认选中第一个
                btn.selected = true
                label.textColor = UIColor.orangeColor()
            }
            
            
            //添加约束
            btn.snp_makeConstraints(closure: { (make) in
                make.top.bottom.equalTo(self.bgTabView!)
                make.width.equalTo(w)
                make.left.equalTo(w*CGFloat(i))
            })
            
            label.snp_makeConstraints(closure: { (make) in
                make.left.right.equalTo(btn)
                make.bottom.equalTo(btn).offset(-4)
                make.height.equalTo(12)
            })
            
        }

    }
    
    
    func clickBtn(btn: UIButton) {
        
        let index = btn.tag-200
        
        //取消之前的选中
        let lastBtn = self.bgTabView?.viewWithTag(200+self.selectedIndex) as! UIButton
        lastBtn.selected = false
        
        let lastLabel = lastBtn.viewWithTag(300) as! UILabel
        lastLabel.textColor = UIColor.grayColor()
        
        //选中当前的按钮
        btn.selected = true
        let curLabel = btn.viewWithTag(300) as! UILabel
        curLabel.textColor = UIColor.orangeColor()
        
        self.selectedIndex = index

    }
    
    
   
    func hideTabBar(){
        UIView.animateWithDuration(0.01) { 
            self.bgTabView?.hidden = true
        }
    }
    

    func showTabBar(){
        
        UIView.animateWithDuration(0.01) { 
            self.bgTabView?.hidden = false
        }
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
