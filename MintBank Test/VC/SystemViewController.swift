//
//  SystemViewController.swift
//  Mint
//
//  Created by Temitope on 01/09/2021.
//

import UIKit

class SystemViewController: UIViewController {

    @IBOutlet weak var defaultTick: UILabel!
    @IBOutlet weak var lightTick: UILabel!
    @IBOutlet weak var DarkTick: UILabel!

    @IBOutlet weak var DarkBtb: UIButton!
    @IBOutlet weak var lightBtn: UIButton!
    @IBOutlet weak var defaultBTn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        lightTick.text = ""
        DarkTick.text = ""
    }
    
    @IBAction func Default(_ sender: UIButton) {
        UIApplication.shared.windows.forEach { window in
                    //here you can switch between the dark and light
            window.overrideUserInterfaceStyle = .unspecified
        }
        
        buttonTapped(sender: defaultBTn)
    }
    @IBAction func Light(_ sender: UIButton) {
        UIApplication.shared.windows.forEach { window in
                    //here you can switch between the dark and light
            window.overrideUserInterfaceStyle = .light
        }
        buttonTapped(sender: lightBtn)
    }
    @IBAction func Dark(_ sender: UIButton) {
        UIApplication.shared.windows.forEach { window in
                    //here you can switch between the dark and light
            window.overrideUserInterfaceStyle = .dark
        }
        buttonTapped(sender: DarkBtb)
    }
    
    func buttonTapped(sender: UIButton) {
           switch sender {
           case DarkBtb:
            lightTick.text = ""
            DarkTick.text = "✔️"
            defaultTick.text = ""
           case lightBtn:
            lightTick.text = "✔️"
            DarkTick.text = ""
            defaultTick.text = ""
           case defaultBTn:
            lightTick.text = ""
            DarkTick.text = ""
            defaultTick.text = "✔️"
           default:
            lightTick.text = ""
            DarkTick.text = ""
            defaultTick.text = "✔️"
           }
       }

}
