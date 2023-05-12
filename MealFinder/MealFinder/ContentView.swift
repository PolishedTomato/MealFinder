//
//  ContentView.swift
//  MealFinder
//
//  Created by Deye Lei on 5/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var categories : [Category]? = nil
    
    func fetchCategory()async{
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else{
            print("url failed")
            return
        }
        
        guard let (response, _) = try? await URLSession.shared.data(from: url)else {
            print("api failed")
            return
        }
        
        do{
            categories = try JSONDecoder().decode([String: [Category]].self, from: response)["categories"]!
            print("decode success")
        }
        catch{
            print("decode failed")
        }
    }
    
    var body: some View {
        NavigationView{
            if categories == nil{
                ProgressView()
            }
            else{
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
                        ForEach(categories!,id: \.self) { category in
                            NavigationLink {
                                CategoryView(category: category.strCategory)
                            } label: {
                                VStack(alignment: .center){
                                    AsyncImage(url: URL(string: category.strCategoryThumb)) { image in
                                        image.resizable()
                                            .scaledToFit()
                                            .cornerRadius(16)
                                            .shadow(radius: 5)
                                    } placeholder: {
                                        Image(systemName: "birthday.cake.fill")
                                    }
                                    Text(category.strCategory)
                                        .font(.title.bold())
                                        .foregroundColor(.black)
                                    
                                }
                                .padding()
                            }
                        }
                    }
                }
                .navigationTitle("Recipe categories")
            }
        }
        .task{
            await fetchCategory()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
