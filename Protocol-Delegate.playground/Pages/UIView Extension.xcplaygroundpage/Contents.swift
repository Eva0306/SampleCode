import UIKit
import PlaygroundSupport

// 擴展 UIView 來添加邊框
extension UIView {
    func addBorder(borderColor: UIColor, borderThickness: CGFloat) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderThickness
    }
}

// 建立一個 UIView 的實例，並使用擴展方法來添加邊框
let borderedView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
borderedView.backgroundColor = .systemOrange
borderedView.addBorder(borderColor: .systemBlue, borderThickness: 5.0)

PlaygroundPage.current.liveView = borderedView

