//: Not Follow Protocol-Delegate Design Pattern 2

class Restaurant {
    let waiter = Waiter()
    let counterStaff = CounterStaff()

    func customerWants(dish: String) {
        print("Restaurant: 顧客點了 \(dish)")
        waiter.takeOrder(dishName: dish)
        counterStaff.takeOrder(dishName: dish)
    }
}

class Waiter {
    func takeOrder(dishName: String) {
        print("Waiter: 正在處理點餐，菜單項目是：\(dishName)")
    }
}

class CounterStaff {
    func takeOrder(dishName: String) {
        print("CounterStaff: 正在櫃台處理點餐，菜單項目是：\(dishName)")
    }
}

let restaurant = Restaurant()
restaurant.customerWants(dish: "Pizza")
