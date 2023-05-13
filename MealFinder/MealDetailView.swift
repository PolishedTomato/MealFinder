//
//  MealDetailView.swift
//  MealFinder
//
//  Created by Deye Lei on 5/11/23.
//

import Foundation
import SwiftUI
import AVKit

struct MealDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ViewModel = ViewModel()
    let mealID: String
    
    var body: some View {
        NavigationView{
            ScrollView{
                if viewModel.mealDetail == nil{
                    ProgressView()
                }
                else{
                    VStack(alignment: .leading){
                        if let youtubeLink = viewModel.mealDetail?.strYoutube, youtubeLink != ""{
                        
                            YouTubeVideoPlayer(youtubeUrl: youtubeLink)
                                .frame(height: UIScreen.main.bounds.height * 0.3)
                                .cornerRadius(16)
                        
                        }
                        Text(viewModel.mealDetail!.strMeal ?? "N/A")
                            .font(.title.bold())
                        
                        Text("Things you need")
                            .font(.headline.bold())
                            .padding(.top)
                        Rectangle()
                            .frame(height: 1)
                        
                        ForEach(viewModel.ingredients, id:\.self) { material in
                            Text(material)
                        }
                        
                        Text("Instruction")
                            .font(.headline.bold())
                            .padding(.top)
                        Rectangle()
                            .frame(height:1)
                        Text(viewModel.mealDetail!.strInstructions ?? "Instruction not provided")
                        
                    }
                    .padding()
                }
            }
            .task{
                await viewModel.mealDetail = viewModel.fetchMealDetail(mealID: mealID)
                viewModel.ingredients = viewModel.getIngredients(mealDetail: viewModel.mealDetail)
            }
            .toolbar {
                Button("cancel", role: .cancel){
                    dismiss()
                }
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealID: "52773")
    }
}
