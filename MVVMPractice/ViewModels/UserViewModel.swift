//
//  UserViewModel.swift
//  MVVMPractice
//
//  Created by Pritesh Kankaria on 19/02/21.
//

import Foundation

struct UserViewModel {
    let name, username: String
    let address: Address
    let company: Company
    let phone: String
    let website: String
    var favourite: Bool = false
    
    init(user: User) {
        self.name = user.name
        self.username = user.username
        self.address = user.address
        self.company = user.company
        self.phone = user.phone
        self.website = user.website
    }
}
