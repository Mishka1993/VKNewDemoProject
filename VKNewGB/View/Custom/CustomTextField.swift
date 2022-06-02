import UIKit

class CustomTextField: UITextField {
    enum corner {
        case defaultValue
        case top
        case bottom
    }
    
    var cornerObject:corner = .defaultValue
    var styleApp = ApplicationStyle()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderStyle = .none
    }
    
    func setupIndentFromEdge(indent: CGFloat) {
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: indent, height: self.frame.height))
        self.leftViewMode = .always
    }
    
    func setupColorPlaceholder(color: UIColor) {
        let colorPlaceholderText = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont(name: "VK Sans Display", size: 18) as Any])
                
        self.attributedPlaceholder = colorPlaceholderText
        
    }
    
    func configureClearButtonColor(color: UIColor) {

        guard let clearButton = self.value(forKey: "_clearButton") as? UIButton else {
            return
        }
        let templateImage = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
        clearButton.setImage(templateImage, for: .normal)
        clearButton.setImage(templateImage, for: .highlighted)
        clearButton.tintColor = color
    }
    
    func roundCorners(corners:UIRectCorner, radius:CGFloat) {
        let bounds = self.bounds
        
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        
        
        
        let frameLayer = CAShapeLayer()
        frameLayer.frame = bounds
        frameLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        frameLayer.strokeColor = UIColor.darkGray.cgColor
        frameLayer.fillColor = UIColor.init(red: 67, green: 67, blue: 67, alpha: 0).cgColor
        self.layer.addSublayer(frameLayer)
    }
    
    func roundTopCornersRadius(radius: CGFloat) {
        roundCorners(corners: [UIRectCorner.topLeft, UIRectCorner.topRight], radius:radius)
    }
    
    func roundBottomCornersRadius(radius:CGFloat) {
        roundCorners(corners: [UIRectCorner.bottomLeft, UIRectCorner.bottomRight], radius:radius)
    }
    
    override func draw(_ rect: CGRect) {
        switch cornerObject {
        case .bottom: roundBottomCornersRadius(radius: 8)
        case .top: roundTopCornersRadius(radius: 8)
        case .defaultValue: break
        }
    }
}
