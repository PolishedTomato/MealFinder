//
//  MealFinderTests.swift
//  MealFinderTests
//
//  Created by Deye Lei on 5/12/23.
//

import XCTest

final class MealFinderTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //test the api response and decoding of fetching data about food category
    func test_fetchCategory()async {
        let res = await ContentView().fetchCategory()
        XCTAssertNotNil(res)
        //something is returned
        XCTAssertNotEqual(res, [])
    }
    
    //test fetchMeal function for all meal category
    func test_fetchMeal()async {
        let allCategories = await ContentView().fetchCategory()
        let category_name = allCategories!.map{
            $0.strCategory
        }
        
        for category in category_name{
            let res = await CategoryView.ViewModel().fetchMeals(category: category)
            XCTAssertNotEqual(res, [])
        }
    }
    
    //test fetchMealDetail function in MealDetailView
    func test_fetchMealDetail() async{
        let allCategories = await ContentView().fetchCategory()
        let category_name = allCategories!.map{
            $0.strCategory
        }
        
        for category in category_name{
            let meals = await CategoryView.ViewModel().fetchMeals(category: category)
            for meal in meals{
                let mealDetail: MealDetail? = await MealDetailView(mealID: meal.id).viewModel.fetchMealDetail(mealID: meal.id)
                
                XCTAssertNotNil(mealDetail)
            }
        }
    }
    
    //test getIngredient method in MealDetail.viewModel
    @MainActor func test_ingredientExtraction(){
        let test_case1 = MealDetail.example1
        let test_case2 = MealDetail.example2
        let test_case3 = MealDetail.example3
        
        let ans1 = ["Sesame: 2 cups", "Breed: 1", "Coke: 2 bottles", "Candy: 7 pieces", "Milk: 1 bottle"]
        let ans2 = ["Chicken Breast: 2 Grams", "Sake: 5 L", "Sprite: 10 bottles!", "Big Mac: 3", "Apple Juice: 4 bottles"]
        let ans3 = ["Sesame: 2 cups", "Breed: 1", "Coke: 2 bottles", "Candy: 7 pieces"]
        
        XCTAssertEqual(ans1, MealDetailView.ViewModel().getIngredients(mealDetail: test_case1))
        
        XCTAssertEqual(ans2, MealDetailView.ViewModel().getIngredients(mealDetail: test_case2))
        
        XCTAssertEqual(ans3, MealDetailView.ViewModel().getIngredients(mealDetail: test_case3))
    }
}
