//
//  DetailViewController.swift
//  Milestone13-15
//
//  Created by nikita on 15.02.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var shareList = [String]()
    var webView: WKWebView!
    var detailItem: Country?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.facts)
        </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: nil)
        
        
    }
    
    @objc func share() {
            var masiv = [Any]()
            let list = shareList.joined(separator: "\n")
            masiv.append(list)
            let vc = UIActivityViewController(activityItems: masiv, applicationActivities: [])
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true)
    }
    
    
}
