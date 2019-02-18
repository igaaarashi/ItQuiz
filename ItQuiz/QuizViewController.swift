//
//  QuizViewController.swift
//  ItQuiz
//
//  Created by Strawberry jam on 2019/01/31.
//  Copyright © 2019 Strawberry jam. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var aAnswerButton: UIButton!
    @IBOutlet weak var bAnswerButton: UIButton!
    @IBOutlet weak var cAnswerButton: UIButton!
    @IBOutlet weak var dAnswerButton: UIButton!
    @IBOutlet weak var quizText: UILabel!
    
    //共通変数
    //問題数のカウント
    var questionCount:Int = 0
    //正解数のカウント
    var correctCount:Int = 0
    //答えの番号
    var answerNum:Int = 0
    
    //なんのクイズのカテゴリかを取得するための変数
    var quizCategory:Array<Any>!
    var quizCategoryName:String!
    var quizCategoryIdentifier:String!
    
    //カテゴリの中にクイズを入れる
    let simpleQuiz = QuizCategory(
        categoryName:"簡単", quizList:
            QuizItem(quizText:"2018年6月19日、あるIT企業が東証マザーズ市場に新規上場しました。記者会見した同社のCEO（最高経営責任者）は、米グーグルや米アマゾン・ドットコムを目標に「テックカンパニーとして世界を目指す」と宣言しました。この企業とは、次のうちどれでしょう。",choices:["freee","スマートニュース","ビズリーチ","メルカリ"],answerNum:3),
            QuizItem(quizText:"2018年6月4日、米国のIT企業が、ソースコード管理サービス「GitHub」を提供する米ギットハブを買収すると発表しました。この企業とは、次のうちどれでしょう。",choices:["米IBM","米アマゾン・ドットコム","米フェイスブック","米マイクロソフト"],answerNum:3),
            QuizItem(quizText:"2018年6月5日、「dynabook（ダイナブック）」ブランドで知られる東芝のPC事業を、ある企業が買収することで合意したと発表されました。同年10月1日の買収完了を目指します。",choices:["シャープ","富士通","中国レノボ","米HP"],answerNum:0),
            QuizItem(quizText:"2018年8月2日、ビッグデータ分析を手掛ける米トレジャーデータを、ある海外企業が買収すると発表しました。トレジャーデータは、日本人エンジニアが米シリコンバレーで起業したスタートアップです。",choices:["米アップル","米マイクロソフト","英アーム","中国アリババ集団"],answerNum:2),
            QuizItem(quizText:"ある金融機関が2018年7月18日、個人からパーソナルデータを預かり、本人の同意を得たうえで他企業に提供する、個人データ銀行の事業構想を発表しました。既に関連技術について国内で特許を出願済みで、2019年度中（2020年3月まで）のサービス開始を目指します。",choices:["みずほ信託銀行","住信SBIネット銀行","三井住友信託銀行","三菱UFJ信託銀行"],answerNum:4),
            QuizItem(quizText:"簡単6",choices:["A","B","C","D"],answerNum:1),
            QuizItem(quizText:"簡単7",choices:["A","B","C","D"],answerNum:1),
            QuizItem(quizText:"簡単8",choices:["A","B","C","D"],answerNum:1)
       )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizText.numberOfLines = 0
        updata()
        self.quizCategoryName = quizCategory![0] as? String
        self.quizCategoryIdentifier = quizCategory![1] as? String
        print(quizCategoryName!)

        quizDataPut(quizCategoryIdentifier!)
       
        // Do any additional setup after loading the view.
    }

    @IBAction func aAnswerAction(_ sender: Any) {
        correctJudgment(answerActionNum: 0,answerNum: answerNum)
        updata()
    }
    @IBAction func bAnswerAction(_ sender: Any) {
        correctJudgment(answerActionNum: 1,answerNum: answerNum)
        updata()
    }
    @IBAction func cAnswerAction(_ sender: Any) {
        correctJudgment(answerActionNum: 2,answerNum: answerNum)
        updata()
    }
    @IBAction func dAnswerAction(_ sender: Any) {
        correctJudgment(answerActionNum: 3,answerNum: answerNum)
        updata()
    }
    
    //問題と回答を更新する関数
    func updata(){
        if questionCount == 5{
            gotoResult()
        }else{
            quizText.text = simpleQuiz.quizList[questionCount].quizText
            aAnswerButton.setTitle(simpleQuiz.quizList[questionCount].choices[0], for: UIControl.State())
            bAnswerButton.setTitle(simpleQuiz.quizList[questionCount].choices[1], for: UIControl.State())
            cAnswerButton.setTitle(simpleQuiz.quizList[questionCount].choices[2], for: UIControl.State())
            dAnswerButton.setTitle(simpleQuiz.quizList[questionCount].choices[3], for: UIControl.State())
            answerNum = simpleQuiz.quizList[questionCount].answerNum
            questionCount = questionCount+1
        }
    }
    
    func quizDataPut(_ Identifier:String){
        print(Identifier)
        switch Identifier {
        case "kiso":
            print(Identifier)
        case "html":
            print(Identifier)
        case "css":
            print(Identifier)
        default:
            return
        }
        
        
        
        
        
        
    }
    
    func correctJudgment(answerActionNum:Int,answerNum:Int){
        if answerActionNum == answerNum{
            correctCount = correctCount + 1
        }
    }
    func gotoResult(){
        performSegue(withIdentifier:"toResult",sender:correctCount)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.score = sender as? Int
        }
    }
}
