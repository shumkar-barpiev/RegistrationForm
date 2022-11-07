//
//  RegistrationViewController.swift
//  RegistrationForm
//
//  Created by User on 4/11/22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var emailTextField = UITextField()
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
       
        userNameTextField = UITextField(frame: CGRect(x: 50, y: 317, width: 314, height: 43))
        userNameTextField.addPadding()
        userNameTextField.placeholder = "userName"
        userNameTextField.layer.cornerRadius = 10.0
        userNameTextField.layer.borderWidth = 2.0
        userNameTextField.layer.borderColor = UIColor.black.cgColor
        
        
        emailTextField = UITextField(frame: CGRect(x: 50, y: 400, width: 314, height: 43))
        emailTextField.addPadding()
        emailTextField.placeholder = "e-mail"
        emailTextField.layer.cornerRadius = 10.0
        emailTextField.layer.borderWidth = 2.0
        emailTextField.layer.borderColor = UIColor.black.cgColor
        
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
        self.view.addSubview(self.emailTextField)
        self.view.addSubview(self.userNameTextField)
        self.view.addSubview(self.pass1TextField)
        self.view.addSubview(self.pass2TextField)
        self.view.addSubview(self.registerButton)
        
        
    }
    
    @objc private func registrationAction(){
        
        if emailTextField.text?.count == 0 && userNameTextField.text?.count == 0 && pass1TextField.text?.count == 0 && pass2TextField.text?.count == 0{
            let alertController = UIAlertController(title: "Warning!!!", message: "Complete the text fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
        }else if pass1TextField.text?.count ?? 0 <= 8  {
            let alertController = UIAlertController(title: "Warning!!!", message: "Your password length have to more or equal to 8", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }else if pass1TextField.text != pass2TextField.text{
            let alertController = UIAlertController(title: "Warning!!!", message: "Please, enter the password correctly again.", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
        }else if emailTextField.text?.count == 0 && userNameTextField.text?.count == 0{
            let alertController = UIAlertController(title: "Warning!!!", message: "Enter user name and e-mail.", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }else if emailTextField.text?.count == 0{
            let alertController = UIAlertController(title: "Warning!!!", message: "Enter an e-mail.", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
        }else if userNameTextField.text?.count == 0{
            let alertController = UIAlertController(title: "Warning!!!", message: "Enter a user name.", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
        }else if pass1TextField.text?.count == 0{
            let alertController = UIAlertController(title: "Warning!!!", message: "Enter a password.", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
        }else{
            let eMail = emailTextField.text!
            if eMail.contains("@") && eMail.contains(".") {
                
                let id = UUID.self()
                let userName = userNameTextField.text!
                let password = pass1TextField.text!
                
                print(password)
                print(id)
            }else{
                let alertController = UIAlertController(title: "Warning!!!", message: "Enter the e-mail correctly. For example: eMail@example.com ", preferredStyle: .alert)
                let action = UIAlertAction(title: "ok", style: .cancel) { _ in
                    
                }
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
//    CoreData implementation
    
    func createUser(_ id: UUID, _ fullName: String, _ userName: String, _ passWord: String){
        let newUser = AppUser(context: context)
        newUser.id = id
        newUser.fullName = fullName
        newUser.userName = userName
        newUser.password = passWord
        
        do{
            try context.save()
        }catch{
            //error
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


