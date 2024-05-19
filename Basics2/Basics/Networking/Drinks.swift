//
//  Drinks.swift
//  Basics
//
//  Created by Chaitanya Soni on 14/04/24.
//

import Foundation

struct DrinksByLetter: Codable {
    
    let drinks: [Drink]?
    
//    enum CodingKeys: CodingKey {
//        case drinks
//    }
    
}

struct Drink: Codable {
    let id: String?
    let strDrink: String?
    let strCategory: String?
    let strAlcoholic: String?
    let strInstructions: String?
    let strDrinkThumb: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case strDrink
        case strCategory
        case strAlcoholic
        case strInstructions
        case strDrinkThumb
    }
}
