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
    @State var mealDetail: MealDetail? = nil
    let mealID: String
    
    func fetchMealDetail() async{
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")else{
            print("invaild url")
            return
        }
        
        guard let (response,_) = try? await URLSession.shared.data(from: url) else{
            print("api failed \(url)")
            return
        }
        
        do{
            mealDetail = try JSONDecoder().decode([String:[MealDetail]].self, from: response)["meals"]![0]
            print("decode success")
        }
        catch{
            print("decode failed")
        }
    }
    
    var materials: [String]{
        var materialArray: [String] = []
        
        if mealDetail!.strIngredient1 != ""{
            let res = mealDetail!.strIngredient1 + ": " + mealDetail!.strMeasure1
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient2 != ""{
            let res = mealDetail!.strIngredient2 + ": " + mealDetail!.strMeasure2
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient3 != ""{
            let res = mealDetail!.strIngredient3 + ": " + mealDetail!.strMeasure3
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient4 != ""{
            let res = mealDetail!.strIngredient4 + ": " + mealDetail!.strMeasure4
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient5 != ""{
            let res = mealDetail!.strIngredient5 + ": " + mealDetail!.strMeasure5
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient6 != ""{
            let res = mealDetail!.strIngredient6 + ": " + mealDetail!.strMeasure6
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient7 != ""{
            let res = mealDetail!.strIngredient7 + ": " + mealDetail!.strMeasure7
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient8 != ""{
            let res = mealDetail!.strIngredient8 + ": " + mealDetail!.strMeasure8
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient9 != ""{
            let res = mealDetail!.strIngredient9 + ": " + mealDetail!.strMeasure9
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient10 != ""{
            let res = mealDetail!.strIngredient10 + ": " + mealDetail!.strMeasure10
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient11 != ""{
            let res = mealDetail!.strIngredient11 + ": " + mealDetail!.strMeasure11
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient12 != ""{
            let res = mealDetail!.strIngredient12 + ": " + mealDetail!.strMeasure12
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient13 != ""{
            let res = mealDetail!.strIngredient13 + ": " + mealDetail!.strMeasure13
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient14 != ""{
            let res = mealDetail!.strIngredient14 + ": " + mealDetail!.strMeasure14
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient15 != ""{
            let res = mealDetail!.strIngredient15 + ": " + mealDetail!.strMeasure15
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient16 != ""{
            let res = mealDetail!.strIngredient16 + ": " + mealDetail!.strMeasure16
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient17 != ""{
            let res = mealDetail!.strIngredient17 + ": " + mealDetail!.strMeasure17
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient18 != ""{
            let res = mealDetail!.strIngredient18 + ": " + mealDetail!.strMeasure18
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient19 != ""{
            let res = mealDetail!.strIngredient19 + ": " + mealDetail!.strMeasure19
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        if mealDetail!.strIngredient20 != ""{
            let res = mealDetail!.strIngredient20 + ": " + mealDetail!.strMeasure20
            materialArray.append(res)
        }
        else{
            return materialArray
        }
        
        return materialArray
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                if mealDetail == nil{
                    ProgressView()
                }
                else{
                    VStack(alignment: .leading){
                        if mealDetail!.strYoutube != ""{
                            YouTubeVideoPlayer(youtubeUrl: mealDetail!.strYoutube)
                                .frame(height: UIScreen.main.bounds.height * 0.3)
                                .cornerRadius(16)
                        }
                        Text(mealDetail!.strMeal)
                            .font(.title.bold())
                        
                        Text("Things you need")
                            .font(.headline.bold())
                            .padding(.top)
                        Rectangle()
                            .frame(height: 1)
                        
                        ForEach(materials, id:\.self) { material in
                            Text(material)
                        }
                        
                        Text("Instruction")
                            .font(.headline.bold())
                            .padding(.top)
                        Rectangle()
                            .frame(height:1)
                        Text(mealDetail!.strInstructions)
                        
                    }
                    .padding()
                }
            }
            .task{
                await fetchMealDetail()
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
        MealDetailView(mealID: "52819")
    }
}
