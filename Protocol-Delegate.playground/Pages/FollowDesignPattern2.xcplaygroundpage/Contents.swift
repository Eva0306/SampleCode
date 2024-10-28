//: Follow Protocol-Delegate Design Pattern

protocol OrderDelegate {
    func takeOrder(dishName: String)
}

class Restaurant {
    var delegate: OrderDelegate?

    func customerWants(dish: String) {
        print("Restaurant: 顧客點了 \(dish)")
        delegate?.takeOrder(dishName: dish) // 將點餐工作委託給代理
    }
}

class Waiter: OrderDelegate {
    func takeOrder(dishName: String) {
        print("Waiter: 正在處理點餐，菜單項目是：\(dishName)")
    }
}

class CounterStaff: OrderDelegate {
    func takeOrder(dishName: String) {
        print("CounterStaff: 正在櫃台處理點餐，菜單項目是：\(dishName)")
    }
}

let restaurant = Restaurant()
let waiter = Waiter()
restaurant.delegate = waiter  // 餐廳指定服務生作為代理
restaurant.customerWants(dish: "Pizza")

let counterStaff = CounterStaff()
restaurant.delegate = counterStaff // 餐廳指定櫃檯人員作為代理
restaurant.customerWants(dish: "Pizza")


