//
//  CategoryView.swift
//  MealFinder
//
//  Created by Deye Lei on 5/11/23.
//

import Foundation
import SwiftUI

struct CategoryView: View {
    let category: String
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            
            ScrollView{
                VStack{
                    ForEach(viewModel.sortedMeals, id:\.self){ meal in
                
                        MealView(meal: meal)
                            .padding(.bottom, 30)
                            .onTapGesture(perform: {
                                viewModel.selectedMeal = meal
                            })
                            .sheet(item: $viewModel.selectedMeal) { meal in
                                MealDetailView(mealID: meal.id)
                            }
                    }
                }
            }
            .padding()
            .navigationTitle(self.category)
            .task{
                await viewModel.meals = viewModel.fetchMeals(category: self.category)
            }
            .searchable(text: $viewModel.searchText)
            
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: "Dessert")
    }
}
