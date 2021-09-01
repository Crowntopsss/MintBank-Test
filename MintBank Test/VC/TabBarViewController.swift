//
//  TabBarViewController.swift
//  Mint
//
//  Created by Temitope on 31/08/2021.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.selectedIndex = 1
        setupMiddleButton()
    }
    
    
    func setupMiddleButton() {
            let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 25, y: -30, width: 60, height: 60))
            
            middleButton.setBackgroundImage(UIImage(named: "FAG"), for: .normal)
            middleButton.layer.shadowColor = UIColor.black.cgColor
            middleButton.layer.shadowOpacity = 0.1
            middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
            
            self.tabBar.addSubview(middleButton)
            
            self.view.layoutIfNeeded()
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

