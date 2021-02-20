//
//  UserDetailsViewController.swift
//  MVVMPractice
//
//  Created by Pritesh Kankaria on 20/02/21.
//

import UIKit

protocol FavouriteUpdateDelegate {
    func didUpdateFavourite(_: UserViewModel)
}

class UserDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var addFavouriteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    
    var userViewModel: UserViewModel?
    var favouriteUpdateDelegate: FavouriteUpdateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails()
    }
    
    func showDetails(){
        if let userViewModel = userViewModel {
            nameLabel.text = userViewModel.name
            usernameLabel.text = "[" + userViewModel.username + "]"
            phoneLabel.text = ": " + userViewModel.phone
            websiteLabel.text = ": " + userViewModel.website
            streetLabel.text = ": " + userViewModel.address.street
            suiteLabel.text = ": " + userViewModel.address.suite
            cityLabel.text = ": " + userViewModel.address.city
            companyNameLabel.text = ": " + userViewModel.company.name
            catchPhraseLabel.text = ": " + userViewModel.company.catchPhrase
            bsLabel.text = ": " + userViewModel.company.bs
            
            if userViewModel.favourite == true {
                favouriteButton.setImage(UIImage(named: "star-fill-image"), for: .normal)
                addFavouriteLabel.text = "Added as Favorite!"
            }
            else {
                favouriteButton.setImage(UIImage(named: "star-image"), for: .normal)
                addFavouriteLabel.text = "Add Favorite?"
            }
        }
    }
    
    @IBAction func favouriteButtonPressed(_ sender: UIButton) {
        if userViewModel?.favourite == true {
            sender.setImage(UIImage(named: "star-image"), for: .normal)
            userViewModel?.favourite = false
            addFavouriteLabel.text = "Add Favorite?"
            favouriteUpdateDelegate?.didUpdateFavourite(userViewModel!)
        }
        else {
            sender.setImage(UIImage(named: "star-fill-image"), for: .normal)
            userViewModel?.favourite = true
            addFavouriteLabel.text = "Added as Favorite!"
            favouriteUpdateDelegate?.didUpdateFavourite(userViewModel!)
        }
    }
}
