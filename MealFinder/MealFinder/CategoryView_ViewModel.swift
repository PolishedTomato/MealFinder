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
        @Published var category = ""
        
        func fetchMeals(category: String)async->[Meal]{
            self.category = category
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
                print("CategoryView decode success category: \(category)")
                return res
            }
            catch{
                print("CategoryView decode failed category: \(category)")
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
