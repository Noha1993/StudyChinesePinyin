//
//  SignInViewController.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/14.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signInButton(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                SVProgressHUD.showSuccess(withStatus: "Success!")
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "TabView")
                self.present(nextView, animated: true, completion: nil)
            } else {
                SVProgressHUD.showError(withStatus: "Error!")
            }
        }
    }
}
