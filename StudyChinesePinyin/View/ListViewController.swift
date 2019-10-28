//
//  ListViewController.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/14.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit
import Firebase

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var words: [Word] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! CustomCell
        let word = words[indexPath.row]
        cell.pinLabel.text = word.pinyin
        cell.chiLabel.text = word.chinese
        cell.japLabel.text = word.japanese
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let user = Auth.auth().currentUser else {
            return
        }
        let word = words[indexPath.row]
        let deleteID = word.documentID
        Firestore.firestore().collection(user.uid).document(deleteID).delete()
        if editingStyle == UITableViewCell.EditingStyle.delete {
            words.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let user = Auth.auth().currentUser else {
            return
        }
        words = []
        Firestore.firestore().collection(user.uid).order(by: "createdAt")
            .getDocuments { (snapshot, error) in
                if error == nil, let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        let post = Word(data: data)
                        self.words.append(post)
                    }
                    if self.words.count == 0 {
                        let document = Firestore.firestore().collection(user.uid).document()
                        let documentID = document.documentID
                        let data: [String: Any] = [
                            "documentID": documentID,
                            "pinyin": "yiqi xue zhongwen ba",
                            "chinese": "一起學中文吧",
                            "japanese": "一緒に中国語を学びましょう",
                            "createdAt": Timestamp(date: Date())
                        ]
                        document.setData(data)
                        let post = Word(data: data)
                        self.words.append(post)
                    }
                    self.myTableView.reloadData()
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        
    }
}
