//
//  CookbookViewController.swift
//  TestKitchen_Swift
//
//  Created by gaokunpeng on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CookbookViewController: KTCBaseViewController, UIScrollViewDelegate, KTCSegmentCtrlDelegate {
    
    
    //滚动视图
    private var scrollView: UIScrollView?
    
    //首页推荐
    private var recommendModel: CBRecommedModel?
    private var recommendView: CBRecommendView?
    
    //首页食材
    private var materialModel: CBMaterialModel?
    private var materialView: CBMaterialView?
    
    
    //首页分类
    private var categoryModel: CBMaterialModel?
    private var categoryView: CBMaterialView?
    
    //导航上面的选择控件
    private var segCtrl: KTCSegmentCtrl?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        //首页视图
        self.createHomePageView()
        
        //首页导航
        self.createMyNav()
        
        //下载食材首页推荐的数据
        self.downloadMaterialData()
        
        //下载分类的数据
        self.downloadCategoryData()
    }
    
    
    //首页视图
    func createHomePageView(){}
    
    //扫一扫
    func scanAction(){
        
    }
    
    //搜索
    func searchAction(){}
    
    //首页导航
    func createMyNav(){
        
        //扫一扫
        self.addNavBtnImages(["saoyisao"], target: self, action: #selector(scanAction), isLeft: true)
        
        //分段控件
        self.segCtrl = KTCSegmentCtrl(frame: CGRectMake(80, 0, kScreenW-80*2, 44), titleArray: ["推荐","食材","分类"])
        self.segCtrl?.delegate = self
        self.navigationItem.titleView = self.segCtrl
        
        //搜索
        self.addNavBtnImages(["search"], target: self, action: #selector(searchAction), isLeft: false)
        
    }
    
    //下载食材首页推荐的数据
    func downloadRecommendData(){}
    
    //下载食材数据
    func downloadMaterialData(){}
    
    //下载分类的数据
    func downloadCategoryData(){
        
        
        
        
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //显示tabBar
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let mainTabBar = appDele.window?.rootViewController as! KTCMainTabBarController
        mainTabBar.showTabBar()
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        //隐藏tabBar
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let mainTabBar = appDele.window?.rootViewController as! KTCMainTabBarController
        mainTabBar.hideTabBar()
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


//MARK: KTCSegCtrl代理
extension CookbookViewController {
    
    func didSelectSegCtrlAtIndex(index: Int) {
        
    }
    
}
