//
//  ViewController.swift
//  MVVMPractice
//
//  Created by Pritesh Kankaria on 19/02/21.
//

import UIKit

class UserViewController: UITableViewController {
    let cellNibName = "UserCell"
    let cellIdentifier = "ReusableCell"
    let segueIdentifier = "UserDetails"
    var userViewModels = [UserViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.fetchUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func fetchUsers() {
        Service.shared.fetchUsers { (users, error) in
            self.userViewModels = users?.map({return UserViewModel(user: $0)}) ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: - TableView DataSource Methods
extension UserViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! UserCell
        cell.userViewModel = userViewModels[indexPath.row]
        return cell
    }
}

//MARK: - TableView Delegate Methods
extension UserViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! UserDetailsViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.userViewModel = userViewModels[indexPath.row]
            destinationVC.favouriteUpdateDelegate = self
        }
    }
}

//MARK: - FavouriteUpdateDelegate
extension UserViewController: FavouriteUpdateDelegate {
    func didUpdateFavourite(_ userViewModel: UserViewModel) {
        if let indexPath = tableView.indexPathForSelectedRow{
            print(indexPath.row)
            userViewModels[indexPath.row].favourite = userViewModel.favourite
            self.tableView.reloadData()
        }
    }
}
