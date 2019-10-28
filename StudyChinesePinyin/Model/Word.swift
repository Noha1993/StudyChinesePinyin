//
//  Word.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/14.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit
import Firebase

struct Word {
    let documentID: String
    let pinyin: String
    let chinese: String
    let japanese: String
    let createdAt: Timestamp
    
    init(data: [String: Any]) {
        documentID = data["documentID"] as! String
        pinyin = data["pinyin"] as! String
        chinese = data["chinese"] as! String
        japanese = data["japanese"] as! String
        createdAt = data["createdAt"] as! Timestamp
    }
}
