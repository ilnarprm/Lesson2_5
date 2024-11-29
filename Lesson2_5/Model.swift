//
//  Model.swift
//  Lesson2_5
//
//  Created by Ilnar on 27.11.2024.
//

import Foundation

struct TableUsers {
    let image: String
    let name: String
    var someText: String? = nil

    static func mockUsersData() -> [TableUsers] {
        [
            TableUsers(image: "user1", name: "User 1"),
            TableUsers(image: "user2", name: "User 2"),
            TableUsers(image: "user3", name: "User 3"),
            TableUsers(image: "user4", name: "User 4")
        ]
    }

    static func mockGroupData() -> [TableUsers] {
        [
            TableUsers(image: "userG1", name: "Group 1", someText: "some Text"),
            TableUsers(image: "userG2", name: "Group 2", someText: "some Text"),
            TableUsers(image: "userG3", name: "Group 3", someText: "some Text"),
            TableUsers(image: "userG4", name: "Group 4", someText: "some Text")
        ]
    }
}
