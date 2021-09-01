//
//  ViewController.swift
//  Mint
//
//  Created by Temitope on 31/08/2021.
//

import UIKit
import FlagPhoneNumber
import FMSecureTextField

class ViewController: UIViewController {

    
    @IBOutlet weak var passwordText: FMSecureTextField!{
        didSet{
        passwordText.secureViewShowMode = .whileEditing
        passwordText.getSecureButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tickImage: UIImageView!
    @IBOutlet weak var checkBorder: UIView!
    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    let button = UIButton(type: .custom)
    var btnColor = UIButton(type: .custom)
    var goodNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        phoneNumber()
        checkBox()
    }
    @IBAction func loginButton(_ sender: UIButton) {
        if goodNum == 1 && passwordText.text != "" {
            let vc = (storyboard?.instantiateViewController(identifier: "TabBarViewController"))! as TabBarViewController
            navigationController?.pushViewController(vc, animated: false)
        } else{
        let alert = UIAlertController(title: "Alert", message: "Check your details", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
        }
       
    }
    
    
    func checkBox() {
        checkBorder.layer.borderWidth = 2
        checkBorder.layer.borderColor = #colorLiteral(red: 0.8536946177, green: 0.690679431, blue: 0.2981466949, alpha: 1)
    }
    
    func phoneNumber() {
        view.backgroundColor = UIColor.groupTableViewBackground
        phoneNumberTextField.borderStyle = .roundedRect
      
        phoneNumberTextField.displayMode = .list // .picker by default

        listController.setup(repository: phoneNumberTextField.countryRepository)

        listController.didSelect = { [weak self] country in
            self?.phoneNumberTextField.setFlag(countryCode: country.code)
        }

        phoneNumberTextField.delegate = self
        phoneNumberTextField.font = UIFont.systemFont(ofSize: 14)

        // Custom the size/edgeInsets of the flag button
        phoneNumberTextField.flagButtonSize = CGSize(width: 35, height: 35)
        phoneNumberTextField.flagButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        // Example of customizing the textField input accessory view
        let items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: nil),
            UIBarButtonItem(title: "Item 1", style: .plain, target: self, action: nil),
            UIBarButtonItem(title: "Item 2", style: .plain, target: self, action: nil)
        ]
        phoneNumberTextField.textFieldInputAccessoryView = getCustomTextFieldInputAccessoryView(with: items)

        phoneNumberTextField.hasPhoneNumberExample = false
        phoneNumberTextField.placeholder = "8022312332"

        phoneNumberTextField.setFlag(countryCode: .NG)

        // Set the phone number directly
        phoneNumberTextField.set(phoneNumber: "")

        view.addSubview(phoneNumberTextField)

        phoneNumberTextField.center = view.center
    }

    private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar()

        toolbar.barStyle = UIBarStyle.default
        toolbar.items = items
        toolbar.sizeToFit()

        return toolbar
    }

    @objc func dismissCountries() {
        listController.dismiss(animated: true, completion: nil)
    }


}

extension ViewController: FPNTextFieldDelegate {

    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if phoneNumberTextField.text!.count > 7 {
            if isValid {
                goodNum = 1
                print(goodNum)
            } else {
                goodNum = 0
            }
        }
    }

    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }


    func fpnDisplayCountryList() {
        let navigationViewController = UINavigationController(rootViewController: listController)

        listController.title = "Countries"
        listController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissCountries))

        self.present(navigationViewController, animated: true, completion: nil)
    }
}

