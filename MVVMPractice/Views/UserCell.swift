//
//  UserTableViewCell.swift
//  MVVMPractice
//
//  Created by Pritesh Kankaria on 19/02/21.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var userViewModel: UserViewModel! {
        didSet {
            name.text = userViewModel.name
            company.text = userViewModel.company.name
            phone.text = userViewModel.phone
            website.text = userViewModel.website
            let favouriteButtonImage = userViewModel.favourite ? UIImage(systemName: "star.fill") : (UIImage(systemName: "star"))
            favouriteButton.setImage(favouriteButtonImage, for: .normal)
        }
    }
}
