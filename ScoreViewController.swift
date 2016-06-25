//
//  ScoreViewController.swift
//  VeseKentei
//
//  Created by 酒井恭平 on 2016/06/19.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

//import Cocoa
import UIKit
import Social


class ScoreViewController: UIViewController {
    
    //KenteiViewControllerの正解数を受け取るメンバ変数
    var correct = 0
    //正解数を表示するラベル
    @IBOutlet var scoreLabel: UILabel!
    //合格 or 不合格画像を表示する画像
    @IBOutlet var judgeImageView: UIImageView!
    
    @IBOutlet var goukakuTimesLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    var goukakuTimes = 0
    var rankString = "ビギナー"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //合格回数を保存するNSUerDefaults
        let goukakuUd = NSUserDefaults.standardUserDefaults()
        //合格回数をgoukakuというキー値で変数gokakuTimesに格納
        goukakuTimes = goukakuUd.integerForKey("goukaku")
        //正解数を表示
        scoreLabel.text = "正解数は\(correct)もんです。"
        //合格・不合格を判定
        if correct >= 7{
            judgeImageView.image = UIImage(named: "Goukaku.png")
            goukakuTimes += 1      //合格回数をカウントアップ
            //goukakuキー値を使って合格回数(goukakuTimes)を保存
            goukakuUd.setInteger(goukakuTimes, forKey: "goukaku")
        }else{
            judgeImageView.image = UIImage(named: "Fugoukaku.png")
        }
        
        //合格回数を表示
        goukakuTimesLabel.text = "合格回数は\(goukakuTimes)回です。"
        
        //合格回数によってランクを決定
        if goukakuTimes >= 50 {
            rankString = "達人"
        }
        else if goukakuTimes >= 40{
            self.rankString = "師匠"
        }
        else if goukakuTimes >= 30{
            self.rankString = "師範代"
        }
        else if goukakuTimes >= 20{
            self.rankString = "上級者"
        }
        else if goukakuTimes >= 10{
            self.rankString = "ファン"
        }
        else if goukakuTimes >= 0{
            self.rankString = "ビギナー"
        }
        //ランクラベルに称号を決定
        rankLabel.text = "ランクは\(rankString)！"
    }
    
    @IBAction func postFacebook(sender: AnyObject){
        
        //Facebook投稿用インスタンスを作成
        let fbVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        //投稿テキストを設定
        fbVC.setInitialText("三浦のおやさい検定：私は\(rankString)。合格回数は\(goukakuTimes)回です。")
        //投稿よ画像を設定
        fbVC.addImage(UIImage(named: "icon.png"))
        //投稿用URLを設定
        fbVC.addURL(NSURL(string: "http://onthehammock.com/app/5783"))
        //投稿コントローラを起動
        self.presentViewController(fbVC, animated: true, completion: nil)
        
    }
    
    @IBAction func postTwitter(sender: AnyObject){
        
        //Twitter投稿用インスタンスを作成
        let twVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        //投稿テキストを設定
        twVC.setInitialText("三浦のおやさい検定：私は\(rankString)。合格回数は\(goukakuTimes)回です。")
        //投稿よ画像を設定
        twVC.addImage(UIImage(named: "icon.png"))
        //投稿用URLを設定
        twVC.addURL(NSURL(string: "http://onthehammock.com/app/5783"))
        //投稿コントローラを起動
        self.presentViewController(twVC, animated: true, completion: nil)
        
    }
    
    
    
    

}
