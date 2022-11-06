//
//  RegistrationViewController.swift
//  RegistrationForm
//
//  Created by User on 4/11/22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fullNameTextField = UITextField()
    var userNameTextField = UITextField()
    var pass1TextField = UITextField()
    var pass2TextField = UITextField()
    var registrationLabel = UILabel()
    var registerButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Registration"
        createUI()
    }
    
    
//    MARk: create UI
    
    private func createUI(){
        registrationLabel = UILabel(frame: CGRect(x: 50, y: 152, width: 202, height: 98))
        registrationLabel.text = "Create an Account"
        registrationLabel.textAlignment = .left
        registrationLabel.numberOfLines = 0
        registrationLabel.font = UIFont.boldSystemFont(ofSize: 28)
    
        
        fullNameTextField = UITextField(frame: CGRect(x: 50, y: 317, width: 314, height: 43))
        fullNameTextField.addPadding()
        fullNameTextField.placeholder = "Full Name"
        fullNameTextField.layer.cornerRadius = 10.0
        fullNameTextField.layer.borderWidth = 2.0
        fullNameTextField.layer.borderColor = UIColor.black.cgColor
       
        userNameTextField = UITextField(frame: CGRect(x: 50, y: 400, width: 314, height: 43))
        userNameTextField.addPadding()
        userNameTextField.placeholder = "userName"
        userNameTextField.layer.cornerRadius = 10.0
        userNameTextField.layer.borderWidth = 2.0
        userNameTextField.layer.borderColor = UIColor.black.cgColor
        
        
        pass1TextField = UITextField(frame: CGRect(x: 50, y: 483, width: 314, height: 43))
        pass1TextField.addPadding()
        pass1TextField.placeholder = "Password"
        pass1TextField.layer.cornerRadius = 10.0
        pass1TextField.layer.borderWidth = 2.0
        pass1TextField.layer.borderColor = UIColor.black.cgColor
        pass1TextField.isSecureTextEntry = true
        
        
        pass2TextField = UITextField(frame: CGRect(x: 50, y: 566, width: 314, height: 43))
        pass2TextField.addPadding()
        pass2TextField.placeholder = "Enter Again Password"
        pass2TextField.layer.cornerRadius = 10.0
        pass2TextField.layer.borderWidth = 2.0
        pass2TextField.layer.borderColor = UIColor.black.cgColor
        pass2TextField.isSecureTextEntry = true
        
        
        
        registerButton = UIButton(frame: CGRect(x: 78, y: 666, width: 258, height: 48))
        registerButton.setTitle("Create Account", for: .normal)
        registerButton.backgroundColor = UIColor.systemRed
        registerButton.layer.cornerRadius = 25.0
        
        registerButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
        
        
        self.view.addSubview(self.registrationLabel)
        self.view.addSubview(self.fullNameTextField)
        self.view.addSubview(self.userNameTextField)
        self.view.addSubview(self.pass1TextField)
        self.view.addSubview(self.pass2TextField)
        self.view.addSubview(self.registerButton)
        
        
    }
    
    @objc private func registrationAction(){
        if pass1TextField.text == pass2TextField.text{
            print("Tuura")
        }else{
            let alertController = UIAlertController(title: "Warning!!!", message: "Enter right informations, or password", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}


extension UITextField {
    func addPadding(){
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
