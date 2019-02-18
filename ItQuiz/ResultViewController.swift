//
//  ResultViewController.swift
//  ItQuiz
//
//  Created by Strawberry jam on 2019/01/31.
//  Copyright © 2019 Strawberry jam. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var score :Int?
    var total = 5
    @IBOutlet weak var resultText: UILabel!
    override func viewDidLoad() {
        resultText.numberOfLines = 0
        super.viewDidLoad()
        //オプショナル型を解除する カプセル外でも使えるように、 guard let を使用
        guard let score = score else {
            return
        }
        let rate = score / total
        print(rate * 100)
        resultText.text = "あなたの正解数は\(score)問です\n天才です!あなたは完璧IT博士!"
    }
}
