//: Protocol & Delegate
/*:
 * Protocol 就像是「點餐流程」，定義了「如何接收顧客的點單」這個行為，任何人遵循這個流程就能完成點餐任務。
 * Delegate 就像是「服務生」或「櫃台人員」，他們可以按照點餐流程來完成接單任務。
 * 任務的委託是餐廳將點餐的責任交給服務生或櫃台，服務生或櫃台作為「代理人」來處理顧客的需求。
 */

import UIKit

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

let restaurant = Restaurant()
let waiter = Waiter()

restaurant.delegate = waiter  // 餐廳指定服務生作為代理
restaurant.customerWants(dish: "Pizza")

