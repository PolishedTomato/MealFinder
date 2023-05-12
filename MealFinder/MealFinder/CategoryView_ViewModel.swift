//
//  CategoryView_ViewModel.swift
//  MealFinder
//
//  Created by Deye Lei on 5/11/23.
//

import Foundation

extension CategoryView{
    @MainActor class ViewModel: ObservableObject{
        init(){
            
        }
        
        @Published var meals: [Meal] = []
        @Published var searchText = ""
        @Published var selectedMeal : Meal? = nil
        
        func fetchMeals(category: String)async{
            let mealUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)"
            guard let url = URL(string: mealUrl) else{
                print("invaild url")
                return
            }
            
            guard let (response,_) = try? await URLSession.shared.data(from: url) else{
                print("api failed")
                return
            }
            
            do{
                meals = try JSONDecoder().decode([String: [Meal]].self, from: response)["meals"]!
                print("decode success")
            }
            catch{
                print("decode failed")
            }
        }
        
        var filterMeals: [Meal]{
            if searchText == ""{
                return meals
            }
            else{
                return meals.filter{$0.strMeal.localizedCaseInsensitiveContains(searchText)}
            }
        }
    }
}
