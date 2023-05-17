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
    enum CodingKeys: CodingKey{
        case idMeal, strMeal, strDrinkAlternate, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube, strIngredient1, strIngredient2, strIngredient3, strIngredient4,strIngredient5,strIngredient6,strIngredient7,strIngredient8,strIngredient9,strIngredient10,strIngredient11,strIngredient12,strIngredient13,strIngredient14,strIngredient15,strIngredient16,strIngredient17,strIngredient18,strIngredient19,strIngredient20,strMeasure1,
             strMeasure2,strMeasure3,strMeasure4,strMeasure5,strMeasure6,strMeasure7,strMeasure8,strMeasure9,strMeasure10,strMeasure11,strMeasure12,strMeasure13,strMeasure14,strMeasure15,strMeasure16,strMeasure17,strMeasure18,strMeasure19,strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idMeal = try container.decode(String.self, forKey: CodingKeys.idMeal)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strDrinkAlternate = try container.decode(String?.self, forKey: .strDrinkAlternate)
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        self.strArea = try container.decode(String.self, forKey: .strArea)
        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
        self.strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        self.strTags = try container.decode(String?.self, forKey: .strTags)
        self.strYoutube = try container.decode(String?.self, forKey: .strYoutube)
        
        var ingredent:String? = ""
        var measure:String? = ""
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient1)
        measure = try container.decode(String?.self, forKey: .strMeasure1)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient2)
        measure = try container.decode(String?.self, forKey: .strMeasure2)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient3)
        measure = try container.decode(String?.self, forKey: .strMeasure3)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient4)
        measure = try container.decode(String?.self, forKey: .strMeasure4)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient5)
        measure = try container.decode(String?.self, forKey: .strMeasure5)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient6)
        measure = try container.decode(String?.self, forKey: .strMeasure6)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient7)
        measure = try container.decode(String?.self, forKey: .strMeasure7)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient8)
        measure = try container.decode(String?.self, forKey: .strMeasure8)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient9)
        measure = try container.decode(String?.self, forKey: .strMeasure9)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient10)
        measure = try container.decode(String?.self, forKey: .strMeasure10)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient11)
        measure = try container.decode(String?.self, forKey: .strMeasure11)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient12)
        measure = try container.decode(String?.self, forKey: .strMeasure12)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient13)
        measure = try container.decode(String?.self, forKey: .strMeasure13)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient14)
        measure = try container.decode(String?.self, forKey: .strMeasure14)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient15)
        measure = try container.decode(String?.self, forKey: .strMeasure15)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient16)
        measure = try container.decode(String?.self, forKey: .strMeasure16)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient17)
        measure = try container.decode(String?.self, forKey: .strMeasure17)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient18)
        measure = try container.decode(String?.self, forKey: .strMeasure18)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient19)
        measure = try container.decode(String?.self, forKey: .strMeasure19)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
        ingredent = try container.decode(String?.self, forKey: .strIngredient20)
        measure = try container.decode(String?.self, forKey: .strMeasure20)
        
        if let i = ingredent, let m = measure, i != "" && m != ""{
            material.append(i+": "+m)
        }
        
    }
    
    var material: [String] = []
    
    var idMeal: String
    var strMeal: String
    var strDrinkAlternate: String?
    var strCategory: String
    var strArea: String
    var strInstructions:String
    var strMealThumb: String
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

