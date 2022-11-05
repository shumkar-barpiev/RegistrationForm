//
//  AllUsersViewController.swift
//  RegistrationForm
//
//  Created by User on 4/11/22.
//

import UIKit

class AllUsersViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "All Users"
    }
    
    
//    MARK: CoreData implementations
        private func getAllUsers(){
            do{
                let users = try context.fetch(AppUser.fetchRequest())
            }catch{
                //error
            }
            
        }
        private func createUser(){
            
            
        }
        private func deleteUser(userObject: AppUser){
            context.delete(userObject)
            
            do{
                try context.save()
            }catch{
                //error
            }
            
            
        }

}
