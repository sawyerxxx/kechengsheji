//
//  LoginViewController.swift
//  weixin
//
//  Created by 博 郑 on 16/4/25.
//  Copyright © 2016年 博 郑&&书潇 黄. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITabBarControllerDelegate{
    var imageView : UIImageView!
    
    var label : UILabel!
    
    var textFiled : UITextField!
    
    var button : UIButton!
    
    var button_2 : UIButton!
   
    //var registerView : RegisterViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        
        /**
        设置导航条
        */
    self.navigationController?.navigationBar.tintColor=UIColor.whiteColor()
        
        
        self.navigationController?.navigationBar.barTintColor=UIColor.blackColor()
        
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationItem.title="微信"
        
        navigationController?.navigationBar.titleTextAttributes = attributes
        //初始化ui
        setupView()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView(){
         imageView = UIImageView(frame: CGRect(x: SCREEN_WIDTH*3/8, y: SCREEN_WIDTH/4, width: SCREEN_WIDTH/4, height: SCREEN_WIDTH/4))
        
        let image = UIImage(named: "1")
        
        imageView.image = image
        
        label = UILabel(frame: CGRect(x: SCREEN_WIDTH/3, y: SCREEN_WIDTH/2+20, width: SCREEN_WIDTH/3, height: 20))
        
        label.text = "18806529680"
        
        label.textAlignment = .Center
        
        self.view.addSubview(imageView)
        
        self.view.addSubview(label)
        
        textFiled = UITextField (frame: CGRect(x: 20, y:SCREEN_WIDTH/2+60 ,width: SCREEN_WIDTH-40, height: 20))
        
        textFiled.secureTextEntry = true
        
        textFiled.placeholder = "请输入密码"
        self.view.addSubview(textFiled)
        
        button = UIButton (frame: CGRect(x: 20, y: SCREEN_WIDTH/2+100, width: SCREEN_WIDTH-40, height: 40))
        
        button.setTitle("登录", forState: UIControlState.Normal)
        
        button.backgroundColor = UIColor.greenColor()
        
        button.addTarget(self, action: "login", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
        button_2 = UIButton(frame: CGRect(x: 0, y: SCREEN_HEIGHT/7*6, width: SCREEN_WIDTH, height: 20))
        
        button_2.setTitle("更多", forState: UIControlState.Normal)
        
        button_2.addTarget(self, action: "register", forControlEvents: .TouchUpInside)
        
        button_2.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        self.view.addSubview(button_2)
        
    }
    func click(){
        print("asdasd")
    }
    
    func register(){
         let registerView = RegisterViewController()
        self.navigationController?.pushViewController(registerView, animated: true)
    }
    func login(){
        //设置微信
        let nav1 = UINavigationController(rootViewController: WeiXinTableViewController())
        
        //设置通讯录
        let nav2 = UINavigationController(rootViewController: TongXunLuTableViewController())
        
        //设置发现
        let nav3 = UINavigationController(rootViewController: FaXianTableViewController())
        
        //设置我
        let nav4 = UINavigationController(rootViewController: WoTableViewController())
        
        //创建tabbarcontroller
        let tabBarController = StatusLightTabBarController()
        
        //设置tabbar的controller
        tabBarController.viewControllers = [nav1, nav2, nav3,nav4]
        tabBarController.tabBar.tintColor = UIColor.whiteColor()
        tabBarController.delegate = self
        
        //设置tabbar item
        nav1.tabBarItem = UITabBarItem(title: "微信", image: UIImage(named: "tabbar_mainframe"), selectedImage: UIImage(named: "tabbar_mainframeHL"))
        nav2.tabBarItem = UITabBarItem(title: "通讯录", image: UIImage(named: "tabbar_contacts"), selectedImage: UIImage(named: "tabbar_contactsHL"))
        nav3.tabBarItem = UITabBarItem(title: "发现", image: UIImage(named: "tabbar_discover"), selectedImage: UIImage(named: "tabbar_discoverHL"))
        nav4.tabBarItem = UITabBarItem(title: "我", image: UIImage(named: "tabbar_me"), selectedImage: UIImage(named: "tabbar_meHL"))
        
        nav1.tabBarController?.tabBar.tintColor=UIColor.greenColor()
        self.presentViewController(tabBarController, animated: true, completion: nil)
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
