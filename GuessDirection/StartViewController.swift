//
//  AnimatedViewController.swift
//  GuessDirection
//
//  Created by jr on 2022/8/21.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //藉由設定segue的id轉到下一頁(SingleViewController)
    @IBAction func startButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSingleViewController", sender: nil)
    }
    

}
