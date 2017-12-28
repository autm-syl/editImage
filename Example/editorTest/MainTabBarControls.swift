//
//  MainTabBarControls.swift
//  editorTest
//
//  Created by Le Cuong on 12/27/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class MainTabBarControls: UITabBarController {
	func createWithdata() {
		
		self.tabBarController?.selectedIndex = 2;
	}
	
	var freshApp = true;	
	
	override func viewWillAppear(_ animated: Bool) {
		if freshApp == true {
			freshApp = false;
			self.tabBarController?.selectedIndex = 0;
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

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
