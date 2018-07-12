//
//  ViewController.swift
//  WebKiosk
//
//  Created by Drew on 12/7/18.
//  Copyright © 2018 CGS. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate
{
    
    var webView: WKWebView!
    var theURL:String = "https://google.com"
    
    override func loadView()
    {
        // Basic webview setup
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        // Read our prefs file
        readPrefs()
        
        // Reload setup code
        webView.scrollView.bounces = true
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.refreshWebView), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Load the page
        loadPage()
    }
    
    func loadPage()
    {
        // In it's own func for funky HiJixing
        let url = URL(string: theURL)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func readPrefs()
    {
        theURL =  "https://example.com/"
        // Check plist URL
        if let prefURL = Bundle.main.object(forInfoDictionaryKey: "AppURL") as? String
        {
            theURL = prefURL
        }
        // Check MDM URL
        if let managedConf = UserDefaults.standard.object(forKey: "com.apple.configuration.managed") as? [String:Any?]
        {
            if let prefURL = managedConf["AppURL"] as? String
            {
                theURL = prefURL
            }
            
        }
    }
    
    @objc func refreshWebView(sender: UIRefreshControl)
    {
        print("refersh")
        //sender.endRefreshing()
        // HiJack the refresh to reload the main page
        loadPage()
        sender.endRefreshing()
    }
    
}

