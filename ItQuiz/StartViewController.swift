//
//  StartViewController.swift
//  ItQuiz
//
//  Created by Strawberry jam on 2019/01/31.
//  Copyright © 2019 Strawberry jam. All rights reserved.
//

import UIKit

class StartViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    //let list = ["A","B","C","D","D"]
    //一つ目の引数がCategory名　2つ目の引数が識別子
    //配列の中に配列ではなくて型を作ってしまった方がいいかな？？？
    let categoryList = [["TI基礎クイズ","kiso"],["HTML","html"],["css","css"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        cell.textLabel!.text = categoryList[indexPath.row][0]
        return cell
    }
    
    //選択時の動き
    func tableView(_ tableView:UITableView,didSelectRowAt indexPath:IndexPath){
        //次の画面へ遷移
        performSegue(withIdentifier: "toQuiz", sender: categoryList[indexPath.row])
        //print(,taskItem.index(of : taskItem[indexPath.row]))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toQuiz"?:
            let QuizViewController = segue.destination as! QuizViewController
            //let _ = QuizViewController.view
            //QuizViewController.quizCategory = sender as? String
            
            QuizViewController.quizCategory = (sender as? Array<Any>? as! Array<Any>)
            
           // print(QuizViewController.quizCategory)
            //case "toAdd"?:
            //print("toAddtoAddtoAdd")
        //self.performSegue(withIdentifier: "toAdd", sender: nil)
        default:
            break
        }
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
