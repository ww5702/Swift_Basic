//
//  ViewController.swift
//  SampleWebView
//
//  Created by 이재웅 on 2022/12/14.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // url string을 준비한다
        // url 주소를 URLRequest로 만든다
        // req >> load
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }
    }
}

