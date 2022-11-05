//
//  ViewController.swift
//  RegistrationForm
//
//  Created by User on 4/11/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let users = [AppUser]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let vc1 = UINavigationController(rootViewController: LoginViewController())
        let vc2 = UINavigationController(rootViewController: RegistrationViewController())
        let vc3 = UINavigationController(rootViewController: AllUsersViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "iphone.and.arrow.forward")
        
        
        vc2.tabBarItem.image = UIImage(systemName: "person.crop.circle.badge.plus")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill.badge.plus")
        
        vc3.tabBarItem.image = UIImage(systemName: "person.3")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "person.3.fill")
        
        
        setViewControllers([vc1, vc2, vc3], animated: true)
    }


}

