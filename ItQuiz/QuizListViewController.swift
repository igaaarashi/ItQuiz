//
//  QuizListViewController.swift
//  ItQuiz
//
//  Created by Strawberry jam on 2019/02/08.
//  Copyright © 2019 Strawberry jam. All rights reserved.
//

import UIKit

class QuizListViewController: UIViewController  ,UITableViewDelegate ,UITableViewDataSource{

    @IBOutlet weak var quizTable: UITableView!
    let list = ["A","B","C","D","D"]
    override func viewDidLoad() {
        super.viewDidLoad()
        quizTable.delegate = self
        quizTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = quizTable.dequeueReusableCell(withIdentifier: "quizCell",for:indexPath)
        cell.textLabel!.text = list[indexPath.row]
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
