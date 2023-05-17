//
//  ContenView_ViewModel.swift
//  MealFinder
//
//  Created by Deye Lei on 5/17/23.
//

import Foundation

extension ContentView{
    @MainActor class ViewModel: ObservableObject{
        @Published var categories : [Category]? = nil
        
        func fetchCategory()async ->[Category]? {
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else{
                print("url failed")
                return nil
            }
            
            guard let (response, _) = try? await URLSession.shared.data(from: url)else {
                print("api failed")
                return nil
            }
            
            do{
                let res = try JSONDecoder().decode([String: [Category]].self, from: response)["categories"]!
                print("fetch categories api decode success")
                return res
            }
            catch{
                print("fetch categories api decode failed")
                return nil
            }
        }
    }
}
