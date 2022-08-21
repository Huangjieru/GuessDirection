//
//  SingleViewController.swift
//  GuessDirection
//
//  Created by jr on 2022/8/20.
//

import UIKit

class SingleViewController: UIViewController {
    //提供亂數做選擇的陣列
    let directions = ["up","down","left","right"]
    //基本分五分，可玩五次
    var score = 5
    var chance = 5
    
    @IBOutlet weak var computerResultImageView: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var chanceLabel: UILabel!
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 進入畫面顯示問號
        computerResultImageView.image = UIImage(systemName: "questionmark")
    }
    
    
    @IBAction func play(_ sender: UIButton) {
        //亂數從陣列中選擇方向
        let direction = directions.randomElement()!
        //顯示亂數選擇方向的圖片，圖片名稱與陣列裡的圖片名稱相同
        computerResultImageView.image = UIImage(named: direction)
        //選擇的方向與電腦相同就贏得比賽。
        var isWin = false
        
        switch sender{
        case upButton:
            isWin = direction == "up"
            
        case downButton:
            isWin = direction == "down"
            
        case leftButton:
            isWin = direction == "left"
           
        case rightButton:
            isWin = direction == "right"
            
        default:
            break
        }
        
        //獲勝得一分並顯示贏了，輸了扣一分並顯示輸了。玩一局少一次機會
        if isWin {
            score += 1
            chance -= 1
            resultLabel.text = "You win"
            scoreLabel.text = "\(score)"
        }else{
            
            if score <= 0{
                score = 0
            }else{
                score -= 1
            }
            resultLabel.text = "You lose"
            scoreLabel.text = "\(score)"
            chance -= 1
        }
        //顯示可玩次數
        chanceLabel.text = "\(chance)"
        //五次機會玩完就結束遊戲，將按鈕全部隱藏
        if chance == 0{
            resultLabel.text = "Game Over"
            upButton.isHidden = true
            downButton.isHidden = true
            leftButton.isHidden = true
            rightButton.isHidden = true
        
        }
    
    }
    //重新開始遊戲
    @IBAction func replay(_ sender: UIButton) {
        //顯示所得的分數。用設定segue設定id到下一頁(ResultViewController)
        performSegue(withIdentifier: "singleVCManual", sender: nil)
        //看完所得分數，玩家按下Replay後返回此頁，一切從新開始
        resultLabel.text = "Guess Direction"
        score = 5
        chance = 5
        scoreLabel.text = "\(score)"
        chanceLabel.text = "\(chance)"
        computerResultImageView.image = UIImage(systemName: "questionmark")
        //顯示全部的Button
        upButton.isHidden = false
        downButton.isHidden = false
        leftButton.isHidden = false
        rightButton.isHidden = false
        
        
    }
    
    // MARK: - Navigation

    //傳遞資料，將此頁成績傳到下一頁，下一頁已有屬性(yourscore)可存放傳入的資料
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        //確認segue的id到要傳入的頁面
        if segue.identifier == "singleVCManual"{
            //將此頁轉到下一頁(ResultViewController)，用as型別轉換成下一頁
            let singleVC = segue.destination as! ResultViewController
            //在此頁可點到下一頁的屬性，將此頁資料傳到下一頁屬性以存放資料
            singleVC.yourScore = self.scoreLabel.text!
        }
        
    }
//點擊下一頁(ResultViewController)的Replay按鈕，藉由Unwind Segue回到此頁(SingleViewController)
    @IBAction func unwindToSingleViewController(segue: UIStoryboardSegue){

    }

}
