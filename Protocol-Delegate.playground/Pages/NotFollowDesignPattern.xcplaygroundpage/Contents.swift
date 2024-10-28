//: Not Follow Protocol-Delegate Design Pattern

class Restaurant {
    let waiter = Waiter() // 餐廳直接依賴於特定的服務生

    func customerWants(dish: String) {
        print("Restaurant: 顧客點了 \(dish)")
        waiter.takeOrder(dishName: dish)  // 直接呼叫 Waiter 的方法來處理點餐
    }
}

class Waiter {
    func takeOrder(dishName: String) {
        print("Waiter: 正在處理點餐，菜單項目是：\(dishName)")
    }
}

let restaurant = Restaurant()
restaurant.customerWants(dish: "Pizza")

