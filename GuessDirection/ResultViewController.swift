//
//  ResultViewController.swift
//  GuessDirection
//
//  Created by jr on 2022/8/20.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    //前一頁得分結果存入此屬性
    var yourScore = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //得分結果呈現於畫面上
        scoreLabel.text = yourScore
    }

    /*
     回到上一頁
     <方法一>
    //退掉此頁，回上一頁
    @IBAction func backToSingleViewController(_ sender: UIButton) {
        dismiss(animated: true)
    }
    */
    /*
    <方法二>
    藉由button回到前一頁（SingleViewController）
    輸入segue的id(backToSingleViewController)回到頁面（SingleViewController）
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "backToSingleViewController", sender: nil)
    }
    */
    /*
    <方法三>
    藉由Unwind Segue回到指定頁面。
    在要回到的頁面寫下
    @IBAction func 名稱(segue:UIStoryboardSegue){}
     */
}
