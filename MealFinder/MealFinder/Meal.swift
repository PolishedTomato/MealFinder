//
//  Meal.swift
//  MealFinder
//
//  Created by Deye Lei on 5/11/23.
//

import Foundation

struct Category: Codable, Hashable{
    var idCategory : String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
}

struct Meal: Codable, Identifiable, Hashable{
    enum CodingKeys: String, CodingKey{
        case id = "idMeal", strMeal, strMealThumb
    }
    var strMeal: String
    var strMealThumb: String
    var id:String
    
}

struct MealDetail: Codable{
    
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions:String?
    var strMealThumb: String?
    var strTags: String?
    var strYoutube: String?
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?

    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?

}

extension MealDetail{
    static let example1 = MealDetail(idMeal: "53050", strMeal: "example meal1", strDrinkAlternate: nil, strCategory: nil, strArea: nil, strInstructions: nil, strMealThumb: nil, strTags: nil, strYoutube: nil, strIngredient1: "Sesame", strIngredient2: "Breed", strIngredient3: "Coke", strIngredient4: "Candy", strIngredient5: "Milk", strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "2 cups", strMeasure2: "1", strMeasure3: "2 bottles", strMeasure4: "7 pieces", strMeasure5: "1 bottle", strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
    
    static let example2 = MealDetail(idMeal: "53050", strMeal: "example meal2", strDrinkAlternate: nil, strCategory: nil, strArea: nil, strInstructions: nil, strMealThumb: nil, strTags: nil, strYoutube: nil, strIngredient1: "Chicken Breast", strIngredient2: "Sake", strIngredient3: "Sprite", strIngredient4: "Big Mac", strIngredient5: "Apple Juice", strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "2 Grams", strMeasure2: "5 L", strMeasure3: "10 bottles!", strMeasure4: "3", strMeasure5: "4 bottles", strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
    
    static let example3 = MealDetail(idMeal: "53050", strMeal: "example meal3", strDrinkAlternate: nil, strCategory: nil, strArea: nil, strInstructions: nil, strMealThumb: nil, strTags: nil, strYoutube: nil, strIngredient1: "Sesame", strIngredient2: "Breed", strIngredient3: nil, strIngredient4: nil, strIngredient5: "Milk", strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: "Coke", strIngredient10: "Candy", strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "2 cups", strMeasure2: "1", strMeasure3: nil, strMeasure4: "7 pieces", strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: "2 bottles", strMeasure10: "7 pieces", strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
    
    
}
