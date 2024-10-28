import UIKit
import PlaygroundSupport

// 定義協定 ViewWithBorder
protocol ViewWithBorder {
    var borderColor: UIColor { get }
    var borderThickness: CGFloat { get }
    init(borderColor: UIColor, borderThickness: CGFloat, frame: CGRect)
}

// 協定擴展，用於限定 UIView 類型的物件
extension ViewWithBorder where Self: UIView {
    func addBorder() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderThickness
    }
}

// 定義類別 UIViewWithBorder，遵循 ViewWithBorder 協定
class UIViewWithBorder: UIView, ViewWithBorder {
    let borderColor: UIColor
    let borderThickness: CGFloat
    
    required init(borderColor: UIColor, borderThickness: CGFloat, frame: CGRect) {
        self.borderColor = borderColor
        self.borderThickness = borderThickness
        super.init(frame: frame)
        addBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let borderedView = UIViewWithBorder(borderColor: .systemBlue, borderThickness: 5.0, frame: CGRect(x: 0, y: 0, width: 200, height: 200))
borderedView.backgroundColor = .systemOrange

PlaygroundPage.current.liveView = borderedView

