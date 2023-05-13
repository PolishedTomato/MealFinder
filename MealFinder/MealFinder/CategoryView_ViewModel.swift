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
        
        func fetchMeals(category: String)async->[Meal]{
            let mealUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)"
            guard let url = URL(string: mealUrl) else{
                print("invaild url")
                return []
            }
            
            guard let (response,_) = try? await URLSession.shared.data(from: url) else{
                print("api failed")
                return []
            }
            
            do{
                let res = try JSONDecoder().decode([String: [Meal]].self, from: response)["meals"]!
                print("decode success")
                return res
            }
            catch{
                print("decode failed")
                return []
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
        
        var sortedMeals: [Meal]{
            filterMeals.sorted { m1, m2 in
                m1.strMeal < m2.strMeal
            }
        }
    }
}
