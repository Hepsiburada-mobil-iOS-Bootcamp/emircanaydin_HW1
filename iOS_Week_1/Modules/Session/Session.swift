//
//  FoodCategory.swift
//  iOS_Week_1
//
//  Created by Emircan Aydın on 24.09.2021.
//

import Foundation

enum FoodCategory {
    case firstCourses
    case mainCourses
    case drinks
}

struct Food {
    var name: String
    var price: Float
}

struct OrderItem {
    var food: Food
    var count: Int
    
    init(food: Food, count: Int) {
        self.food = food
        self.count = count
    }
}

struct Order {
    var firstCourses: [OrderItem] = []
    var mainCourses: [OrderItem] = []
    var drinks: [OrderItem] = []
    var price: Float
    
    //I don't know what mutating is? The IDE issued a warning and when I said fix, the IDE solved it this way.
    mutating func addOrderItem(orderItem: OrderItem, category: FoodCategory) {
        
        switch category {
        case .firstCourses:
            self.firstCourses.append(orderItem)
        case .mainCourses:
            self.mainCourses.append(orderItem)
        case .drinks:
            self.drinks.append(orderItem)
        }
    }
}

class Session {
    var orders = [Order]()
    
    func addOrder() {
        let kebap = Food(name: "Kebap", price: 30)
        let soup = Food(name: "Çorba", price: 10)
        let coke = Food(name: "Kola", price: 5)
        
        let kebapOrderItem = OrderItem(food: kebap, count: 2)
        let soupOrderItem = OrderItem(food: soup, count: 3)
        let cokeOrderItem = OrderItem(food: coke, count: 3)
        
        var order = Order(price: 123)
        
        order.addOrderItem(orderItem: kebapOrderItem, category: .mainCourses)
        order.addOrderItem(orderItem: soupOrderItem, category: .firstCourses)
        order.addOrderItem(orderItem: cokeOrderItem, category: .drinks)
        
        orders.append(order)
    }
}
