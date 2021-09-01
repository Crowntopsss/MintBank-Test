//
//  Legal2ViewController.swift
//  Mint
//
//  Created by Temitope on 01/09/2021.
//

import UIKit
import WebKit

class Legal2ViewController: UIViewController {
    let webkit = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webkit)
        view.backgroundColor = .white
        guard let url = URL(string: "https://bankwithmint.com/privacy-policy") else {return}
        webkit.load(URLRequest(url: url))

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webkit.frame = view.bounds
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
