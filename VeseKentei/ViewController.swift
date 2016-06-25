//
//  ViewController.swift
//  VeseKentei
//
//  Created by 酒井恭平 on 2016/06/19.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var creditLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //CSVファイル名を引数にしてloadCSVメソッドを使用し、CSVファイルを読み込む
        let csvArray = loadCSV("start")
        //print(csvArray)
        
        //logoImageViewに画像を設定
        logoImageView.image = UIImage(named: csvArray[0])
        //titleLabelにアプリ名を設定
        titleLabel.text = csvArray[1]
        //bodyTextViewにアプリ説明文を設定
        bodyTextView.text = csvArray[2]
        //ボタンの文字を白色に変更
        startButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        //creditLabelにクレジットを設定
        creditLabel.text = csvArray[3]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //CSVファイルの読み込みメソッド
    func loadCSV(fileName :String) -> [String]{
        
        //CSVファイルのデータを格納するためのString型配列を宣言
        var csvArray:[String] = []
        //CSVファイルのパスを設定
        let csvBundle = NSBundle.mainBundle().pathForResource(fileName, ofType: "csv")!
        do{
            //csvBundleからファイルを読み込み、エンコーディングしてcsvDataに格納
            let csvData = try String(contentsOfFile: csvBundle, encoding: NSUTF8StringEncoding)
            //改行コードが"\r"の場合は"\n"に置換する
            let lineChange = csvData.stringByReplacingOccurrencesOfString("\r", withString: "\n")
            //"\n"の改行コードで要素を切り分け、配列csvArrayに格納する
            csvArray = lineChange.componentsSeparatedByString("\n")
            
        }catch{
            print("Error!")
        }
        
        return csvArray     //戻り値の配列
    }


}

