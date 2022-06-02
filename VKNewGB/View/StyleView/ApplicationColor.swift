//
//  ApplicationColor.swift
//  VKNewGB
//
//  Created by Михаил Киржнер on 01.06.2022.
//

import UIKit

enum colorApp{
    case ligth
    case black
}

class ApplicationStyle {
    var appStyleManager: colorApp = .ligth
}

extension UIColor {
   final class colorAppLight {
        struct colorTextField {
            static let text = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            static let Placeholder = UIColor.init(red: 154/255, green: 154/255, blue: 154/255, alpha: 1)
        }
    }
}

