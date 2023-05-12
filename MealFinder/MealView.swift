//
//  MealView.swift
//  MealFinder
//
//  Created by Deye Lei on 5/11/23.
//

import Foundation
import SwiftUI

struct MealView: View {
    let meal: Meal
    var body: some View {
        VStack(alignment: .leading){
            Text(meal.strMeal)
                .font(.title.bold())
            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(16)
                    .shadow(radius: 5.0)
            } placeholder: {
                Image(systemName: "fork.knife")
            }
        }
        .cornerRadius(5)
        .padding(.horizontal, 30)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(meal: Meal(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", id: "53049"))
    }
}
