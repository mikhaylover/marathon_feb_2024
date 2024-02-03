//

import UIKit

class ViewController: UIViewController {

    private let gradientView: UIView = UIView(frame: .zero)

    private let viewSide: CGFloat = 100.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setDesign()
    }

    private func setLayout() {
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100.0).isActive = true
        gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        gradientView.widthAnchor.constraint(equalToConstant: viewSide).isActive = true
        gradientView.heightAnchor.constraint(equalToConstant: viewSide).isActive = true
    }


    private func setDesign() {
        gradientView.layer.insertSublayer(makeGradientLayer(), at: 0)
        gradientView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        gradientView.layer.shadowRadius = 16.0
        gradientView.layer.shadowColor = UIColor.black.cgColor
        gradientView.layer.shadowOpacity = 0.5
    }

    private func makeGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: CGSize(width: viewSide, height: viewSide))
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [
            UIColor(hex: 0xF05454).cgColor,
            UIColor(hex: 0x5454F0).cgColor
        ]
        gradientLayer.cornerRadius = 16.0
        return gradientLayer
    }
}

extension UIColor {
    convenience init(hex: Int) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
