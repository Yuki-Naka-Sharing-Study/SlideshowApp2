//
//  ViewController.swift
//  TestSlideshowApp
//
//  Created by 仲優樹 on 2023/01/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画像を設定
        let sampleImage = UIImage(named: "winter.jpeg")
        imageView.image = sampleImage
    }
    
    @IBAction func imageViewTapped(_ sender: Any) {
        print("タップ")

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        //ViewControllerのimage(画像データ)をNextViewControllerのimage(変数)に渡す
        nextVC.image = imageView.image!
        
        //画面遷移
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBOutlet weak var timerLabel: UILabel!

       // タイマー
       var timer: Timer!

       // タイマー用の時間のための変数
       var timer_sec: Float = 0
    
        @objc func updateTimer(_ timer: Timer) {
            self.timer_sec += 0.1
            self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        }

        // 再生ボタン IBAction
        @IBAction func startTimer(_ sender: Any) {
            // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            }
        }

        // 一時停止ボタン IBAction
        @IBAction func pauseTimer(_ sender: Any) {
            // タイマーを停止
            self.timer.invalidate()
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
        }
    
        // リセットボタン IBAction
        @IBAction func resetTimer(_ sender: Any) {
            // リセットボタンを押すと、タイマーの時間を0に
            self.timer_sec = 0
            self.timerLabel.text = String(format: "%.1f", self.timer_sec)
            
            if self.timer != nil {
                self.timer.invalidate()   // タイマーを停止する
                self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            }
        }
}

