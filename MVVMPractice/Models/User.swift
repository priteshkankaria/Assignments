//
//  User.swift
//  MVVMPractice
//
//  Created by Pritesh Kankaria on 19/02/21.
//

import Foundation

//// MARK: - User
//struct User: Codable {
//    let name: String
//    let company: Company
//    let phone: String
//    let website: String
//}
//
//// MARK: - Company
//struct Company: Codable {
//    let name: String
//}
//


// MARK: - User
struct User: Codable {
    let name, username: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

