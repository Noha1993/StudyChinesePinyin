//
//  ViewController.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/11.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pinyinText: UITextField!
    @IBOutlet weak var chineseText: UITextField!
    @IBOutlet weak var japanText: UITextField!
    
    var words: [Word] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinyinText.delegate = self
        chineseText.delegate = self
        japanText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func add(_ sender: Any) {
        guard let user = Auth.auth().currentUser else {
            return
        }
        let document = Firestore.firestore().collection(user.uid).document()
        let documentID = document.documentID
        
        let data: [String: Any] = [
            "documentID": documentID,
            "pinyin": pinyinText.text!,
            "chinese": chineseText.text!,
            "japanese": japanText.text!,
            "createdAt": Timestamp(date: Date())
        ]
        document.setData(data)
        SVProgressHUD.showSuccess(withStatus: "Add!")
    }
}

