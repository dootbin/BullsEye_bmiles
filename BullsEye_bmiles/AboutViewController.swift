//
//  AboutViewController.swift
//  BullsEye_bmiles
//
//  Created by Benjamin Miles on 2/2/19.
//  Copyright © 2019 CVTC Benjamin Miles. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension:"html") {
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    }
}
