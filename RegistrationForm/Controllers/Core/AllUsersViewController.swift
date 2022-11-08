//
//  AllUsersViewController.swift
//  RegistrationForm
//
//  Created by User on 4/11/22.
//

import UIKit

class AllUsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var users = [AppUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "All Users"
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
    }
    override func viewDidAppear(_ animated: Bool) {
        getAllUsers()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(user.userName!)"
        
        return cell
    }
    
    
    
//    MARK: CoreData implementations
        private func getAllUsers(){
            do{
                users = try context.fetch(AppUser.fetchRequest())
                DispatchQueue.main.async { [self] in
                    self.tableView.reloadData()
                }
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
