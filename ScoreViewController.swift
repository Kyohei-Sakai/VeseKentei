//
//  ScoreViewController.swift
//  VeseKentei
//
//  Created by 酒井恭平 on 2016/06/19.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

//import Cocoa
import UIKit

class ScoreViewController: UIViewController {
    
    //KenteiViewControllerの正解数を受け取るメンバ変数
    var correct = 0
    //正解数を表示するラベル
    @IBOutlet var scoreLabel: UILabel!
    //合格 or 不合格画像を表示する画像
    @IBOutlet var judgeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //正解数を表示
        scoreLabel.text = "正解数は\(correct)もんです。"
        //合格・不合格を判定
        if correct >= 7{
            judgeImageView.image = UIImage(named: "Goukaku.png")
        }else{
            judgeImageView.image = UIImage(named: "Fugoukaku.png")
        }
    }
    

}
