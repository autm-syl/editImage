//
//  MainTabBarControls.swift
//  editorTest
//
//  Created by Le Cuong on 12/27/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class MainTabBarControls: UITabBarController, MarketDelegate {
	func createWithdata() {
		
		self.tabBarController?.selectedIndex = 2;
		viewEdit.createWithImage(viewMarket.imgString);
	}
	
	var freshApp = true;
	var viewEdit:CreateController! = nil;
	var viewMarket:MarketController! = nil;
	
	
	override func viewWillAppear(_ animated: Bool) {
		if freshApp == true {
			!freshApp;
			self.tabBarController?.selectedIndex = 0;
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		viewMarket = self.viewControllers![0] as! MarketController;
		viewEdit = self.viewControllers![2] as! CreateController;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
