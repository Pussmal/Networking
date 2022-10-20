//
//  Character.swift
//  Networking
//
//  Created by Алексей Моторин on 20.10.2022.
//

import Foundation

// MARK: - WelcomeElement
struct Character: Codable {
    let name: String
    let species: Species
    let gender: Gender
    let image: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}


enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}



