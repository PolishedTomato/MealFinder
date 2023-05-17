//
//  MealFinderTests.swift
//  MealFinderTests
//
//  Created by Deye Lei on 5/12/23.
//

import XCTest

final class MealFinderTests: XCTestCase {

    //test the api response and decoding of fetching data about food category
    func test_fetchCategory()async {
        let res:[Category]? = await ContentView.ViewModel().fetchCategory()
        XCTAssertNotNil(res)
        //something is returned
        XCTAssertNotEqual(res!, [])
    }
    
    //test fetchMeal function for all meal category
    func test_fetchMeal()async {
        let allCategories = await ContentView.ViewModel().fetchCategory()
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
        let allCategories = await ContentView.ViewModel().fetchCategory()
        let category_name = allCategories!.map{
            $0.strCategory
        }
        
        for category in category_name{
            let meals = await CategoryView.ViewModel().fetchMeals(category: category)
            for meal in meals{
                let mealDetail: MealDetail? = await MealDetailView.ViewModel().fetchMealDetail(mealID: meal.id)
                
                XCTAssertNotNil(mealDetail)
                XCTAssertNotNil(mealDetail?.idMeal)
                XCTAssertNotNil(mealDetail?.strMeal)
                //XCTAssertNotNil(mealDetail?.strDrinkAlternate)
                XCTAssertNotNil(mealDetail?.strCategory)
                XCTAssertNotNil(mealDetail?.strInstructions)
                XCTAssertNotNil(mealDetail?.strMealThumb)
                //XCTAssertNotNil(mealDetail?.strTags)
                //XCTAssertNotNil(mealDetail?.strYoutube)
            }
        }
    }
    //"52827", "52885","52949"
    //test getIngredient method in MealDetail.viewModel
    func test_ingredientExtraction() async{
        var IDs = ["52893", "52806", "52827"]
        var answers = [["Plain Flour: 120g", "Caster Sugar: 60g", "Butter: 60g", "Braeburn Apples: 300g", "Butter: 30g", "Demerara Sugar: 30g", "Blackberrys: 120g", "Cinnamon: \u{00bc} teaspoon", "Ice Cream: to serve" ],
                       ["lemons: 2 Juice", "paprika: 4 tsp", "red onions: 2 finely chopped", "chicken thighs: 16 skinnless", "vegetable oil: For brushing", "Greek yogurt: 300ml ", "ginger: large piece", "garlic clove: 4", "garam masala: \u{00be} tsp", "ground cumin: \u{00be} tsp", "chilli powder: \u{00bd} tsp", "turmeric: \u{00bc} tsp"],
                       ["Peanuts: 85g",
                        "Coconut cream: 400ml can",
                        "Massaman curry paste: 4 tbsp",
                        "Beef: 600g stewing cut into strips",
                        "Potatoes: 450g waxy",
                        "Onion: 1 cut thin wedges",
                        "Lime: 4 leaves",
                        "Cinnamon stick: 1",
                        "Tamarind paste: 1 tbsp",
                        "Brown sugar: 1 tbsp palm or soft light",
                        "Fish Sauce: 1 tbsp",
                        "chilli: 1 red deseeded and finely sliced, to serve",
                        "Jasmine Rice: to serve"]
        ]

        for i in IDs.indices{
            let res = await MealDetailView.ViewModel().fetchMealDetail(mealID: IDs[i])
            XCTAssertEqual(res!.material, answers[i])
        }
        
    }
}
