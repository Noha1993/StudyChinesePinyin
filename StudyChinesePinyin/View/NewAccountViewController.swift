//
//  NewAccountViewController.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/14.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class NewAccountViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func createNewAccountButton(_ sender: Any) {
        let name = userNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        signUp(email: email, password: password, name: name)
    }
    
    private func signUp(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                self.updateDisplayName(name, of: user)
            } else {
                SVProgressHUD.showError(withStatus: "Error!")
            }
        }
    }
    
    private func updateDisplayName(_ name: String, of user: User) {
        let request = user.createProfileChangeRequest()
        request.displayName = name
        request.commitChanges() { error in
            if let error = error {
                print(error)
                SVProgressHUD.showError(withStatus: "Error!")
                return
            }
            self.showSignUpCompletion()
        }
    }
    
    private func showSignUpCompletion() {
        SVProgressHUD.showSuccess(withStatus: "Success!")
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "TabView")
        present(nextView, animated: true, completion: nil)
    }
}
