//
//  QuizViewController.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/14.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class QuizViewController: UIViewController, UITextFieldDelegate {
    
    var words: [Word] = []
    
    var random: Int = 0
    
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var questionLabel1: UILabel!
    @IBOutlet weak var questionLabel2: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTextField.delegate = self
        resultLabel.text = "ピンインを入力してください"
        guard let user = Auth.auth().currentUser else {
            return
        }
        Firestore.firestore().collection(user.uid).order(by: "createdAt")
            .getDocuments { (snapshot, error) in
                if error == nil, let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        let post = Word(data: data)
                        self.words.append(post)
                    }
                }
                self.random = Int.random(in: 0..<self.words.count)
                self.questionLabel1.text = self.words[self.random].japanese
                self.questionLabel2.text = self.words[self.random].chinese
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func answerButton(_ sender: Any) {
        if answerTextField.text == words[random].pinyin {
            resultLabel.text = "正解"
            let syntherizer = AVSpeechSynthesizer()
            let voice = AVSpeechSynthesisVoice(language: "zh-CN")
            let utterance = AVSpeechUtterance(string: words[random].chinese)
            utterance.voice = voice
            syntherizer.speak(utterance)
        } else {
            resultLabel.text = "不正解"
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        answerTextField.text = ""
        resultLabel.text = "ピンインを入力してください"
        guard let user = Auth.auth().currentUser else {
            return
        }
        Firestore.firestore().collection(user.uid).order(by: "createdAt")
            .getDocuments { (snapshot, error) in
                if error == nil, let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        let post = Word(data: data)
                        self.words.append(post)
                    }
                }
                self.random = Int.random(in: 0..<self.words.count)
                self.questionLabel1.text = self.words[self.random].japanese
                self.questionLabel2.text = self.words[self.random].chinese
        }
    }
    
}
