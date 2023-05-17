//
//  ContentView.swift
//  MealFinder
//
//  Created by Deye Lei on 5/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            if viewModel.categories == nil{
                ProgressView()
            }
            else{
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
                        ForEach(viewModel.categories!,id: \.self) { category in
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
            await viewModel.categories = viewModel.fetchCategory()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
