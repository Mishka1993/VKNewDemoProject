//
//  LoginViewElements.swift
//  VKNewGB
//
//  Created by Михаил Киржнер on 02.06.2022.
//

import UIKit

final class LoginViewElements {
    var imageLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppLogoLogin")
        
        return imageView
    }()
    
    var lableHello: UILabel = {
        let lable = UILabel()
        lable.text = "Вход в VK ID"
        lable.textAlignment = .center
        lable.textColor = .white
        lable.font = UIFont(name: "VK Sans Display", size: 25)
        
        return lable
    }()
    
    var userNameTextField: UITextField = {
        let textField = CustomTextField()
        textField.cornerObject = .bottom
        textField.setupIndentFromEdge(indent: 10)
        textField.placeholder = "Телефон или почта"
        textField.font = UIFont(name: "VK Sans Display", size: 18)
        textField.clearButtonMode = .whileEditing
        textField.configureClearButtonColor(color: .white)
        textField.setupColorPlaceholder(color: UIColor(red: 154/255.0, green: 154/255.0, blue: 154/255.0, alpha: 1))
        textField.layer.cornerRadius = 8
        

        return textField
    }()
    
    func setupConstraintsImage(mainView: UIView) {
        let view = mainView.safeAreaLayoutGuide
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        
        let topConst = NSLayoutConstraint(item: imageLogo, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 114)
        let rigthConst = NSLayoutConstraint(item: imageLogo, attribute: .right, relatedBy: .lessThanOrEqual, toItem: view, attribute: .right, multiplier: 1.0, constant: 145)
        let wightConst = NSLayoutConstraint(item: imageLogo, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0, constant: 100)
        let heightConst = NSLayoutConstraint(item: imageLogo, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 100)
        let bottomConst = NSLayoutConstraint(item: imageLogo, attribute: .bottom, relatedBy: .equal, toItem: lableHello, attribute:  .top, multiplier: 1.0, constant: -50.0)
        let alignmentXConst = NSLayoutConstraint(item: imageLogo, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        mainView.addConstraints([topConst, bottomConst, rigthConst, wightConst, heightConst, alignmentXConst])
    }
    
    func setupConstraintsLable(mainView: UIView) {
        let view = mainView.safeAreaLayoutGuide
        lableHello.translatesAutoresizingMaskIntoConstraints = false
        
        let rightConst = NSLayoutConstraint(item: lableHello, attribute: .right, relatedBy: .lessThanOrEqual, toItem: view, attribute: .right, multiplier: 1.0, constant: 82)
        let bottomConst = NSLayoutConstraint(item: lableHello, attribute: .bottom, relatedBy: .equal, toItem: userNameTextField, attribute: .top, multiplier: 1.0, constant: -53)
        let wightConst = NSLayoutConstraint(item: lableHello, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0, constant: 226)
        let heightConst = NSLayoutConstraint(item: lableHello, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 32)
        let alignmentXConst = NSLayoutConstraint(item: lableHello, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        mainView.addConstraints([bottomConst, rightConst, alignmentXConst, wightConst, heightConst])
    }
    
    func setupConstraintsUserTextField(mainView: UIView) {
        let view = mainView.safeAreaLayoutGuide
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomConst = NSLayoutConstraint(item: userNameTextField, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 381)
        let rightConst = NSLayoutConstraint(item: userNameTextField, attribute: .right, relatedBy: .lessThanOrEqual, toItem: view, attribute: .right, multiplier: 1.0, constant: 8)
        let wightConst = NSLayoutConstraint(item: userNameTextField, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0, constant: 374)
        let heightConst = NSLayoutConstraint(item: userNameTextField, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 32)
        let alignmentXConst = NSLayoutConstraint(item: userNameTextField, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)

        mainView.addConstraints([bottomConst, rightConst, wightConst, heightConst, alignmentXConst])
    }
    
    
    func configuration(_ mainView: UIView) {
        mainView.backgroundColor = UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1)
        mainView.addSubview(imageLogo)
        mainView.addSubview(lableHello)
        mainView.addSubview(userNameTextField)
        setupConstraintsImage(mainView: mainView)
        setupConstraintsLable(mainView: mainView)
        setupConstraintsUserTextField(mainView: mainView)
    }
}
