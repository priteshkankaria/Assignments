//
//  MVVMPracticeTests.swift
//  MVVMPracticeTests
//
//  Created by Pritesh Kankaria on 20/02/21.
//

import XCTest
@testable import MVVMPractice

class MVVMPracticeTests: XCTestCase {
    func testSomething(){
        let userModel = User(name: "Leanne Graham", username: "Bret", address: Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough"), phone: "1-770-736-8031 x56442", website: "hildegard.org", company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets"))
        let userViewModel = UserViewModel(user: userModel)
        
        XCTAssertEqual(userModel.name, userViewModel.name)
    }
}
