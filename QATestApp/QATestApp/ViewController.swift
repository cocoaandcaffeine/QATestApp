//
//  ViewController.swift
//  QATestApp
//
//  Created by Gert Andreas on 10.01.18.
//  Copyright © 2018 Gert Andreas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "loginView"
        usernameTextField.accessibilityIdentifier = "usernameTextField"
        passwordTextField.accessibilityIdentifier = "passwordTextField"
        loginButton.accessibilityIdentifier = "loginButton"
        
        loginButton.isEnabled = false
        
        let nc = NotificationCenter.default
        nc.addObserver(forName: Notification.Name.UITextFieldTextDidChange, object: usernameTextField, queue: OperationQueue.main) { (Notification) in
            self.updateLoginButtonIsEnabled()
        }
        
        nc.addObserver(forName: Notification.Name.UITextFieldTextDidChange, object: passwordTextField, queue: OperationQueue.main) { (Notification) in
            self.updateLoginButtonIsEnabled()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions
    
    @IBAction func loginAction(_ sender: Any) {
    }
    
    // MARK: - Helper
    
    private func updateLoginButtonIsEnabled() {
        
        // username
        guard
            let username = usernameTextField.text,
            !username.isEmpty,
            username.range(of: "^[-a-zA-Z0-9_]{2,28}$", options: .regularExpression) != nil else {
                loginButton.isEnabled = false
                return
        }
        
        // password
        guard
            let password = passwordTextField.text,
            !password.isEmpty else {
                loginButton.isEnabled = false
                return
        }
        
        loginButton.isEnabled = true
    }
    
}

