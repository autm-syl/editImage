//
//  MypageController.swift
//  editorTest
//
//  Created by Le Cuong on 12/29/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit
import WebKit

class MypageController: UIViewController, UITextFieldDelegate {

	//////
	@IBOutlet weak var containerWebview: UIView!
	@IBOutlet weak var linkContent: UITextField!
	@IBOutlet weak var refreshBtn: UIButton!
	
	//////
	var webView:WKWebView!
	var currentLink:String!
	
	override func viewDidLoad() {
		super.viewDidLoad();
		linkContent.delegate = self;
		
		//setting webview
		self.settingWebView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		linkContent.endEditing(true);
		return true;
	}
	
	func settingWebView (){
		// get link
		currentLink = linkContent.text;
		
		//set config webview
		let source = "var meta = document.createElement('meta');meta.name = 'viewport';meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';var head = document.getElementsByTagName('head')[0];head.appendChild(meta);";
		let script = WKUserScript.init(source: source, injectionTime: WKUserScriptInjectionTime(rawValue: 1)!, forMainFrameOnly: true);
		
		
		let userContentController = WKUserContentController.init();
		userContentController .addUserScript(script);
		userContentController.add(self, name: "sylvanasBridge");
		let configuration = WKWebViewConfiguration.init();
		configuration.userContentController = userContentController;
		
		// init & load webview
		let url = NSURL.init(string: currentLink);
		let request = NSURLRequest.init(url: url! as URL);
		webView = WKWebView.init(frame: containerWebview.bounds, configuration:configuration);
		webView.navigationDelegate = self;
		webView.uiDelegate = self;
		webView.translatesAutoresizingMaskIntoConstraints = true;
		webView.isOpaque = true;
		webView.scrollView.isScrollEnabled = true;
		webView.scrollView.bounces = true;
		webView.scrollView.bouncesZoom = true;
		webView.load(request as URLRequest);
		containerWebview.addSubview(webView);
	}
	
	@IBAction func refreshBtnClicked(_ sender: Any) {
		if ((webView) != nil){
			webView.reload();
		}
	}
}

extension MypageController:WKNavigationDelegate {
	func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
		print(error.localizedDescription);
	}
	
	func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
		print("start load content");
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		print("finish load content");
	}
}

extension MypageController:WKScriptMessageHandler{
	func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
		//
	}
}
extension MypageController:WKUIDelegate{
	
}
