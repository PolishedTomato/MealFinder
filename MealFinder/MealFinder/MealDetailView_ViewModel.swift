//
//  MealDetailView_ViewModel.swift
//  MealFinder
//
//  Created by Deye Lei on 5/12/23.
//

import Foundation

extension MealDetailView{
    @MainActor class ViewModel: ObservableObject{
        
        init(){
            
        }
        
        @Published var mealDetail: MealDetail? = nil
        @Published var ingredients: [String] = []
        
        func fetchMealDetail(mealID:String) async ->MealDetail? {
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")else{
                print("invaild url")
                return nil
            }
            
            guard let (response,_) = try? await URLSession.shared.data(from: url) else{
                print("api failed \(url)")
                return nil
            }
            
            do{
                let res = try JSONDecoder().decode([String:[MealDetail]].self, from: response)["meals"]![0]
                print("decode success")
                return res
            }
            catch{
                print("decode failed")
                return nil
            }
        }
        
        //Extract ingredient and its needed amount
        //return an array of exiting ingreident with its measure
        func getIngredients(mealDetail:MealDetail?)-> [String]{
            var materialArray: [String] = []
            
            if let material = mealDetail?.strIngredient1, let measure = mealDetail?.strMeasure1, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient2, let measure = mealDetail?.strMeasure2, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient3, let measure = mealDetail?.strMeasure3, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient4, let measure = mealDetail?.strMeasure4, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient5, let measure = mealDetail?.strMeasure5, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient6, let measure = mealDetail?.strMeasure6, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient7, let measure = mealDetail?.strMeasure7, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient8, let measure = mealDetail?.strMeasure8, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient9, let measure = mealDetail?.strMeasure9, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient10, let measure = mealDetail?.strMeasure10, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient11, let measure = mealDetail?.strMeasure11, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient12, let measure = mealDetail?.strMeasure12, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
    
            if let material = mealDetail?.strIngredient13, let measure = mealDetail?.strMeasure13, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
       
            if let material = mealDetail?.strIngredient14, let measure = mealDetail?.strMeasure14, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient15, let measure = mealDetail?.strMeasure15, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            if let material = mealDetail?.strIngredient16, let measure = mealDetail?.strMeasure16, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
      
            if let material = mealDetail?.strIngredient17, let measure = mealDetail?.strMeasure17, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
         
            if let material = mealDetail?.strIngredient18, let measure = mealDetail?.strMeasure18, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
        
            if let material = mealDetail?.strIngredient19, let measure = mealDetail?.strMeasure19, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
        
            if let material = mealDetail?.strIngredient20, let measure = mealDetail?.strMeasure20, material != "" && measure != ""{
                let res = material + ": " + measure
                materialArray.append(res)
            }
            
            return materialArray
        }
    }
}
