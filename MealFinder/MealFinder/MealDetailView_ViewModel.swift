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
                print("mealDetail decode success, meadID: \(mealID)")
                return res
            }
            catch{
                print("mealDetail decode failed, mealID: \(mealID)")
                return nil
            }
        }
    }
}
