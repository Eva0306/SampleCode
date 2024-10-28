import UIKit
import PlaygroundSupport

class BorderedView: UIView {
    var borderColor: UIColor
    var borderThickness: CGFloat
    
    init(borderColor: UIColor, borderThickness: CGFloat, frame: CGRect) {
        self.borderColor = borderColor
        self.borderThickness = borderThickness
        super.init(frame: frame)
        addBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBorder() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderThickness
    }
}

class CustomLabelView: BorderedView {
    let label: UILabel
    
    override init(borderColor: UIColor, borderThickness: CGFloat, frame: CGRect) {
        self.label = UILabel()
        super.init(borderColor: borderColor, borderThickness: borderThickness, frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.frame = bounds
        addSubview(label)
    }
}

let customLabelView = CustomLabelView(borderColor: .systemBlue, borderThickness: 5.0, frame: CGRect(x: 0, y: 0, width: 200, height: 200))
customLabelView.backgroundColor = .systemOrange

PlaygroundPage.current.liveView = customLabelView
