//
//  LoginNewViewController.swift
//  VKNewGB
//
//  Created by Михаил Киржнер on 02.06.2022.
//

import UIKit

class LoginNewViewController: UIViewController {
    
    var elementsView = LoginViewElements()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsView.configuration(view)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
